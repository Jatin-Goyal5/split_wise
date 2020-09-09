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
        style: TextStyle(fontWeight: FontWeight.w300,),),),
      body: new ListView.builder(
        itemCount: settleTransMoney.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [

                  BoxShadow(
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: new ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text(settleTransMoney[index].crediter+"  will pay  "+
                    settleTransMoney[index].settleMoney.toString()+" to  " +settleTransMoney[index].debiter,
                style: TextStyle(
                fontSize: 20.0),
                ),
                dense: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
