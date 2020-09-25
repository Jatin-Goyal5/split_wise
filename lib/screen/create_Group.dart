import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/provider/groupsData.dart';
import 'package:split_wise/screen/peoplelist.dart';

import '../main.dart';



class CreateGroup extends StatefulWidget {


  @override
  _CreateGroupState createState() => _CreateGroupState();
}
GroupData newgroup;
class _CreateGroupState extends State<CreateGroup> {
  List<String> type =["Apartment" , "trip" , "House" ,"Other"];
  List<bool> _selected = List.generate(4, (i) => false);
  List<People> tpeople=[];
  final groupNamecon = new TextEditingController();
  String _groupName;
  String _Trip;
  bool mycolor = true;


  Widget Expenses(index) {

    return new NeumorphicButton(
      style: NeumorphicStyle(
         color: _selected[index] ? Colors.lightBlueAccent : Colors.white,

      ),
      child: Text(type[index],),
      onPressed: () {

        setState(() {
          _Trip = type[index];

          _selected[index] = !_selected[index];

        });

      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final groups =Provider.of<GroupsData>(context);
    final group = groups.getGroup();

    return Scaffold(
      appBar: NeumorphicAppBar(

        title: Text("Group"),

        actions: [
          NeumorphicButton(

            child:Icon(Icons.save),
            onPressed: (){
              _groupName =  groupNamecon.text;
              groups.addGroup(new GroupData(_groupName,_Trip,tpeople));

              Navigator.pop(context);
            },
          )
        ],

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

                border:OutlineInputBorder(

                  borderRadius: const BorderRadius.all(Radius.circular( 20.0)),

                ),
                fillColor: Colors.black,
                focusColor: Colors.black38,
                prefixIcon: Icon(Icons.group,color: Colors.black12,),
                labelText:_groupName ,
              ),
            ) ,


          ),
          Divider(),
         new Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             Expenses(0),
             Expenses(1),
             Expenses(2),
             Expenses(3),

           ],

         ),
          Divider(),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[  NeumorphicText(
              "Group Members",
              style: NeumorphicStyle(
                depth: 80,  //customize depth here
                color: Colors.black54, //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 18, //customize size here
                ),
            ),
            ]
          ),
          Divider(),
          new ListTile(

            title: Text("Add a person to group",style:
              TextStyle(fontSize: 25.0,
                color: Colors.black ,
                  shadows: [ Shadow(
                      offset: Offset(2.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.black87
                  ),
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 8.0,
                      color: Colors.black12,
                    ),]
              ),),
            trailing: IconButton(icon:Icon(Ionicons.ios_person_add,
                color: Colors.black87, size: 36),
            onPressed: (){

              _awaitReturnValueFromSecondScreen(context);

              },
              iconSize: 30,
            ),
          ),
          Divider(),
          ListView.builder(

              shrinkWrap: true,
              itemCount: tpeople.length,
              itemBuilder: (context,index){
                People contact = tpeople[index];
                return new ListTile(
                  leading:Icon(Ionicons.ios_person,size: 25.0,) ,
                  title: Text(contact.getName()==''?contact.getPhoneno():contact.getName(),style: TextStyle(fontSize: 22.0,color: Colors.brown
                     ),
                  ),
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
