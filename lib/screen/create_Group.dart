import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/MyNavigator.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/data/peoplelist.dart';

import '../main.dart';



class CreateGroup extends StatefulWidget {


  @override
  _CreateGroupState createState() => _CreateGroupState();
}
GroupData newgroup;
class _CreateGroupState extends State<CreateGroup> {
  List<People> tpeople=[];
  final groupNamecon = new TextEditingController();
  String _groupName;
  String _Trip;
  bool mycolor = true;
  Widget Expenses(String expenseType) {

    return new FlatButton(
      color:mycolor? Colors.red: Colors.greenAccent,
      child: Text(expenseType),
      onPressed: () {
        _Trip = expenseType;
        setState(() {
          mycolor = !mycolor;
        });

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: new Row(

          children: <Widget>[
            Text("Create a group"),
            SizedBox(width: 80.0,height: 20.0,),
            FlatButton(
              child: Text("Save", style: TextStyle(fontSize: 25.0,color: Colors.white),),
              onPressed: (){

                  _groupName= groupNamecon.text;
                  newgroup = new GroupData(_groupName,_Trip,tpeople);
                  groups.add(newgroup);
                MyNavigator.goToTab(context);
              },
            )
          ],
        ),
      ),
      body: new Scrollbar(
        child: ListView(

        children: <Widget>[
          ListTile(

            title: Text("Group Name"),
            contentPadding: EdgeInsets.all(20.0) ,
            dense: true,
            subtitle:new TextField(
              controller: groupNamecon,
              decoration: InputDecoration(
                focusColor: Colors.redAccent,
                border:OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular( 20.0)),
                ),
                prefixIcon: Icon(Icons.group),
                labelText:_groupName ,
              ),
            ) ,


          ),
          Divider(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expenses("Hotel"),
              Expenses("Launch"),
              Expenses("Trip"),
              Expenses("Party"),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[ Text("Group Members",style: TextStyle(fontSize: 20.0,backgroundColor: Colors.white24 ),),
            ]
          ),
          Divider(),
          new ListTile(

            title: Text("Add a person to group",style: TextStyle(fontSize: 25.0,color: Colors.black45),),
            trailing: IconButton(icon:Icon(Icons.add), iconSize: 50.0,
            onPressed: (){
              _awaitReturnValueFromSecondScreen(context);

              },
            ),
          ),
          Divider(),
          ListView.builder(

              shrinkWrap: true,
              itemCount: tpeople.length,
              itemBuilder: (context,index){
                People contact = tpeople[index];
                return new ListTile(
                  leading:Icon(Icons.person,size: 55.0,color: Colors.black,) ,
                  title: Text(contact.getName()==''?contact.getPhoneno():contact.getName(),style: TextStyle(fontSize: 22.0,color: Colors.brown),),
                );
              }

          )
        ],
      ),
      )

    );
  }
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    final result   = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => peopleList(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {

      tpeople= result;

    });
  }
}
