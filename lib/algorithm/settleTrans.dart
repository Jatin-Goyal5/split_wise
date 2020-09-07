import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_wise/algorithm/ansdetail.dart';
import 'package:split_wise/algorithm/graph_algo.dart';

class settleTrans extends StatefulWidget {
  final int ind;
  settleTrans({Key key, @required this.ind}) : super(key: key);
  @override
  _settleTransState createState() => _settleTransState(ind);
}

class _settleTransState extends State<settleTrans> {
  final int ind;
  _settleTransState(this.ind);


  @override
  Widget build(BuildContext context) {
    List<ansDetail> settleTransMoney= settleUp(ind);
    return new Scaffold(
      appBar: AppBar(title: Text("Settle Money",
        style: TextStyle(fontWeight: FontWeight.w300,fontStyle: FontStyle.normal),),),
      body: new ListView.builder(
        itemCount: settleTransMoney.length,
        itemBuilder: (context,index){
          return Column(
            children: <Widget>[
            new ListTile(

              title: Text(settleTransMoney[index].crediter+"  will pay  "+
                  settleTransMoney[index].settleMoney.toString()+"  " +settleTransMoney[index].debiter,
              style: TextStyle(fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,
              fontSize: 20.0),
              ),
              dense: true,
            ),
              Divider(),
          ]
          );
        },
      ),
    );
  }
}
