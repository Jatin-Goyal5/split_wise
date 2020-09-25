import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';
import 'package:sms/sms.dart';
import 'package:split_wise/data/ansdetail.dart';
import 'package:split_wise/algorithm/graph_algo.dart';
import 'package:split_wise/provider/groupsData.dart';

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
    final cgroupid =ModalRoute.of(context).settings.arguments as String;
    final loadgroup = Provider.of<GroupsData>(context).findByid(cgroupid);
    List<String> name=[];
    List<ansDetail> settleTransMoney= settleUp(loadgroup);
    return new Scaffold(
      appBar: NeumorphicAppBar(title: Text("Settle Money",
       ),),
      body: new ListView.builder(
        itemCount: settleTransMoney.length,
        itemBuilder: (context,index){
          name.add(settleTransMoney[index].crediter);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Neumorphic(
              style:NeumorphicStyle(
                boxShape:  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))
            ,
                surfaceIntensity: 0.2,
                intensity: 0.8,
                depth: 10,
                border: NeumorphicBorder(
                  color: Color(0x33000000),
                  width: 0.8,
                ),
                shadowDarkColor: Colors.black87,
                shadowDarkColorEmboss: Colors.grey
              ),
              child: Slidable(
                secondaryActions: [
                  NeumorphicButton(
                      child: Icon(AntDesign.mail),
                    onPressed: (){

                        String msg = "you owe  "+settleTransMoney[index].debiter+settleTransMoney[index].settleMoney.toString();
                        _sendSMS(msg,"8585937950");


                    },

                    ),
                  NeumorphicButton(
                    child: Icon(AntDesign.delete),
                    onPressed: (){
                      // _sendSMS()


                    },

                  ),

                ],
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
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
            ),
          );
        },
      ),
    );
  }
}
void _sendSMS(String msg , String no) {
  SmsSender sender = new SmsSender();

  SmsMessage message = new SmsMessage(no, msg);
  // message.onStateChanged.listen((state) {
  //   if (state == SmsMessageState.Sent) {
  //     print("SMS is sent!");
  //   } else if (state == SmsMessageState.Delivered) {
  //     print("SMS is delivered!");
  //   }
  // });
  sender.sendSms(message);
}
