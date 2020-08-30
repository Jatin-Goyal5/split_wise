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
      appBar: AppBar(title: Text("jdnsjs"),),
      body: new ListView.builder(
        itemCount: settleTransMoney.length,
        itemBuilder: (context,index){
          return new ListTile(
            title: Text(settleTransMoney[index].debiter+"   "+
                settleTransMoney[index].settleMoney.toString()+"  " +settleTransMoney[index].crediter),
          );
        },
      ),
    );
  }
}
