import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/MyNavigator.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/main.dart';
import 'package:flutter/cupertino.dart';
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
  String ans="you";
  final int ind;
  _addBillState(this.ind);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Row(
          children: <Widget>[
            Text("add Bill"),
            SizedBox(width: 30.0,height: 20.0,),
            FlatButton(
              child: Text("Save"),
              onPressed: (){
                List<People> forTrans= groups[ind].getPeopleList();

                desc=descController.text;
                amount= int.parse(amtController.text);
                groups[ind].addKharche(desc,amount,ans);
                double money = amount/forTrans.length;

                if(!groups[ind].trans.containsKey(ans)){
                  groups[ind].trans[ans] =0;
                }
                groups[ind].trans[ans] -= (money).round();

                for(int i =0 ; i < forTrans.length; i++){
                  String p = forTrans[i].getName();
                  if(p != ans){
                    if(!groups[ind].trans.containsKey(p)){
                      groups[ind].trans[p] = 0;
                    }
                    groups[ind].trans[p] += (money).round();

                  }

                }


                  Navigator.pop(context);
              },

            )
          ],
        ),

      ),
      body:new Column(
        children: <Widget>[
          new Row(

            children: <Widget>[
            new Text (" with you and  :" ,style:TextStyle(
                fontSize: 22.0,fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: const BorderRadius.all(Radius.circular( 20.0)),

                  ),
                  child:Stack(children:<Widget>[
                    new CircleAvatar(
                      child: Icon(Icons.brightness_1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:58.0,right: 25.0,top: 10.0),
                      child: Text(groups[ind].getGroupname()),
                    ),
                  ],
                  ),
                ),
              )
            ],
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
    List<People> Cu=[];
    Cu =  groups[ind].getPeopleList();
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width *0.9,
        height: MediaQuery.of(context).size.height -500.0,
        child: Column(

          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: Cu.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return FlatButton(
                    child:Text(Cu[index].getName().toString()==''?Cu[index].getPhoneno().toString():
                    Cu[index].getName().toString()) ,
                    onPressed: (){
                      ans=Cu[index].getName().toString()==''?
                          Cu[index].getPhoneno().toString():
                            Cu[index].getName().toString();
                    },
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );

  }


}
