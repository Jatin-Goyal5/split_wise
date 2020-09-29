import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/provider/groupsData.dart';

/// Data class to visualize.
class _CostsData {
  final String category;
  final int cost;

  const _CostsData(this.category, this.cost);
}

class PieChartExample extends StatefulWidget {
  const PieChartExample({Key key}) : super(key: key);


  @override
  _PieChartExampleState createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  // Chart configs.
  bool _animate = true;
  bool _defaultInteractions = true;
  double _arcRatio = 1.0;
  charts.ArcLabelPosition _arcLabelPosition = charts.ArcLabelPosition.auto;
  charts.BehaviorPosition _titlePosition = charts.BehaviorPosition.start;
  charts.BehaviorPosition _legendPosition = charts.BehaviorPosition.bottom;

  // Data to render.

  int amt =0;
  int totoalpaid = 0;
  int youpaid =0;

  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<GroupsData>(context);
    final group = groups.getGroup();


    int _apartment =0, _trip=0 , _house=0 ,_other=0;
    for (int i = 0; i < groups.getGroup().length; i++) {
      if(group[i].expenseType == "Apartment") {
        _apartment += group[i].toatleamount;
      }else if(group[i].expenseType == "trip"){
        _trip += group[i].toatleamount;
      }else if(group[i].expenseType == "House"){
        _house += group[i].toatleamount;
      }else if(group[i].expenseType == "Other"){
        _other += group[i].toatleamount;
      }
      totoalpaid = totoalpaid + group[i].toatleamount;
      amt += group[i].trans["You"];
      List<Kharche> ck = group[i].getKharcheList();
      for (int j = 0; j < ck.length; j++) {
        if (ck[j].payer == "You") {
          youpaid += ck[j].amt;
        }
      }

    }
    List<_CostsData> _data = [
      _CostsData('Apartment', _apartment),
      _CostsData('house', _house),
      _CostsData('other', _other),
      _CostsData('trip', _trip),
    ];

    final _colorPalettes =
    charts.MaterialPalette.getOrderedPalettes(_data.length);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 300,
          child: charts.PieChart(
            // Pie chart can only render one series.
          [
          charts.Series<_CostsData, String>(
          id: 'Sales-1',
          colorFn: (_, idx) => _colorPalettes[idx].shadeDefault,
          domainFn: (_CostsData sales, _) => sales.category,
          measureFn: (_CostsData sales, _) => sales.cost,
          data: _data,
          // Set a label accessor to control the text of the arc label.
          labelAccessorFn: (_CostsData row, _) =>
          '${row.category}: ${row.cost}',
        ),
      ],
      animate: this._animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcRatio: this._arcRatio,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(labelPosition: this._arcLabelPosition)
        ],
      ),
      behaviors: [
        // Add title.
        charts.ChartTitle(
          'Activity Data',
          behaviorPosition: this._titlePosition,
        ),
        // Add legend. ("Datum" means the "X-axis" of each data point.)
        charts.DatumLegend(
          position: this._legendPosition,
          desiredMaxRows: 2,
        ),
      ],
    ),
    ),
    Divider(),
     ..._controlWidgets(),
    ],
    );
  }

  /// Widgets to control the chart appearance and behavior.
  List<Widget> _controlWidgets() => <Widget>[
          ListTile(
            leading: NeumorphicText("Total spending  ",
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),),
            subtitle: NeumorphicText(
                totoalpaid.toString(),
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading:amt>0? NeumorphicText("your borrow  ",
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ): NeumorphicText("You lent           ",
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),),
            subtitle: NeumorphicText(
                (amt).abs().toString(),
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: NeumorphicText("You paid             ", style: NeumorphicStyle(
              depth: 1,
              color: Colors.black54
            ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ),
            subtitle:youpaid < 0? new  NeumorphicText("0",
              style: NeumorphicStyle(
                depth: 1,
                color:Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            )
                : NeumorphicText(
                youpaid.toString(),
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.black54
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ),
          ),

        ];
}