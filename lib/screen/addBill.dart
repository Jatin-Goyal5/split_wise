import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/MyNavigator.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:split_wise/provider/groupsData.dart';
class addBill extends StatefulWidget {
  final int ind;
  addBill({Key key, @required this.ind}) : super(key: key);
  @override
  _addBillState createState() => _addBillState(ind);
}

class _addBillState extends State<addBill> {
  final descController= TextEditingController();
  final  amtController= TextEditingController();
  String desc="";
  int amount;
  String ans="YOU";
  final int ind;
  _addBillState(this.ind);
  List<People> cu=[];

  @override
  Widget build(BuildContext context) {
    final cgroupid =ModalRoute.of(context).settings.arguments as String;
    final loadgroup = Provider.of<GroupsData>(context).findByid(cgroupid);
    cu = loadgroup.getPeopleList();

    return new Scaffold(
      appBar: NeumorphicAppBar(
        title: Text("add Bill",),
        actionSpacing: 50.0,
        actions: [
          NeumorphicButton(

            child: Icon(Icons.save,size: 50),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            onPressed: (){
              desc=descController.text;
              amount= int.parse(amtController.text);
              loadgroup.addTrans(ans,amount);
              // loadgroup.toatleamount += amount;
              //
              // double money = amount/cu.length;
              //
              //
              // if(!loadgroup.trans.containsKey(ans)){
              //   loadgroup.trans[ans] =0;
              // }
              // loadgroup.trans[ans] -= amount-(money).round();
              //
              // for(int i =0 ; i < cu.length; i++){
              //   String p = cu[i].getName();
              //   if(p != ans){
              //     if(!loadgroup.trans.containsKey(p)){
              //       loadgroup.trans[p] = 0;
              //     }
              //     loadgroup.trans[p] += (money).round();
              //
              //   }
              //
              // }

              setState(() {

                loadgroup.addKharche(new Kharche(desc, amount, ans));
                Navigator.pop(context);

              });

            },

          )

        ],


      ),
      body:new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(

              children: <Widget>[
              new NeumorphicText(" with you and  :  "+loadgroup.groupName,
                style: NeumorphicStyle(
                  depth: 80,  //customize depth here
                  color: Colors.black, //customize color here
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 25, //customize size here
                ),
    ),
              ],
            ),
          ),
        new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descController,
                decoration: InputDecoration(
                  focusColor: Colors.redAccent,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                  ),
                  prefixIcon: Icon(Icons.description,color: Colors.black,),
                  labelText:"Enter description" ,
                ),
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: amtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusColor: Colors.redAccent,
                  border:OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                  ),
                  prefixIcon: Icon(Icons.attach_money,color: Colors.green,),
                  labelText: "Amount"
                ),
              ),
            ) ,

          ],
          ),
          new Row(
            children: <Widget>[
              Text(" Paid  by  "),
              RaisedButton(
                child: Text(ans),
                onPressed: (){
                  showDialog(
                     context: context,
                     builder: (_)=>alert()
                   );
                  },
              ),
              new Text("split by "),
              RaisedButton(
                child: Text("Equally"),
                onPressed: (){
                  // //List<People> clist= groups[ind].getPeopleList();
                  // setState(() {
                  //   int len =groups[ind].getPeopleList().length;
                  //   // amount= amount/len;
                  //   // groups[ind].trans["name"]=100;
                  // });
                  //

                },
              )

            ],
          )
        ],
      )


    );

  }
  Widget alert(){

    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width *0.9,
        height: MediaQuery.of(context).size.height -450,
        child: Column(

          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cu.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NeumorphicButton(
                      child:NeumorphicText(cu[index].getName().toString()==''?cu[index].getPhoneno().toString():
                      cu[index].getName().toString(),
                      style: NeumorphicStyle(
                        color: Colors.black54
                      ),
                        textStyle: NeumorphicTextStyle(
                        ),
                      ) ,
                      onPressed: (){setState(() {
                        ans=cu[index].getName().toString()==''?
                        cu[index].getPhoneno().toString():
                        cu[index].getName().toString();

                      });

                      },
                    ),
                  );
                },
                shrinkWrap: true,
              ),
            ),
            new NeumorphicButton(
              child: Text("Multiple person"),
              onPressed: (){
                
              },
            )
          ],
        ),
      ),
    );

  }




}
