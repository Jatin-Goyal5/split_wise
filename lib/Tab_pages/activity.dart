import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/provider/groupsData.dart';
import 'package:split_wise/widget/pie_chart.dart';
class activity extends StatefulWidget {
  @override
  _activityState createState() => _activityState();
}

class _activityState extends State<activity> {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<GroupsData>(context);
    final group = groups.getGroup();
    List<String> _exp=[];

    int amt =0;
    int totoalpaid = 0;
    int youpaid =0;
    if(group.length > 0 && group[0].trans.length > 0  ) {
      for (int i = 0; i < groups.getGroup().length; i++) {
        totoalpaid = totoalpaid + group[i].toatleamount;
        amt += group[i].trans["You"];
        _exp.add(group[i].expenseType);
        List<Kharche> ck = group[i].getKharcheList();
        for (int j = 0; j < ck.length; j++) {
          if (ck[j].payer == "You") {
            youpaid += ck[j].amt;
          }
        }
      }
    }
    amt -= youpaid;
     return PieChartExample();
    // group.length == 0?new Center(child: Text("Nothing to show",
    //
    // ),
    // ):
    // ListView(
    //     children:<Widget>[
    //       ListTile(
    //         leading: NeumorphicText("Total spending  ",
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),),
    //         subtitle: NeumorphicText(
    //             totoalpaid.toString(),
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       ListTile(
    //         leading:amt>0? NeumorphicText("your borrow  ",
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         ): NeumorphicText("You lent           ",
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),),
    //         subtitle: NeumorphicText(
    //             (amt).abs().toString(),
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //       ListTile(
    //         leading: NeumorphicText("You paid             ", style: NeumorphicStyle(
    //           depth: 1,
    //           color: Colors.black54
    //         ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //         subtitle:youpaid < 0? new  NeumorphicText("0",
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color:Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         )
    //             : NeumorphicText(
    //             youpaid.toString(),
    //           style: NeumorphicStyle(
    //             depth: 1,
    //             color: Colors.black54
    //           ),
    //           textStyle: NeumorphicTextStyle(
    //             fontSize: 20,
    //           ),
    //         ),
    //       ),
    //
    //     ]
    // );

  }
}

