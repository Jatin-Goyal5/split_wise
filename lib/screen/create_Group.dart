import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_shadow/icon_shadow.dart';

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
  List<String> type =["Apartment" , "trip" , "House" ,"Other"];
  List<bool> _selected = List.generate(4, (i) => false);
  List<People> tpeople=[];
  final groupNamecon = new TextEditingController();
  String _groupName;
  String _Trip;
  bool mycolor = true;
  Widget Expenses(index) {

    return Container(
      decoration: BoxDecoration(
        color: _selected[index] ? Colors.lightBlueAccent : Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 50,
            offset: Offset(3, 4), // changes position of shadow
          ),
          BoxShadow(
              color: Color(0xffA22447).withOpacity(.05),
              offset: Offset(4, 0),
              blurRadius: 5,
              spreadRadius: 3)
        ],
      ),
      child: new FlatButton(

        child: Text(type[index],),
        onPressed: () {
          _Trip = type[index];
          setState(() {

            _selected[index] = !_selected[index];

          });

        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: new Row(

          children: <Widget>[
            Text("Create a group"),
            SizedBox(width: 80.0,height: 20.0,),
            FlatButton(
              child: Text("Save", style: TextStyle(fontSize: 20.0),),
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
            children:<Widget>[ Text("Group Members",style: TextStyle(fontSize: 20.0,
              color: Colors.black,
              shadows: [ Shadow(
                  offset: Offset(2.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.brown
              ),
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 8.0,
                  color: Colors.brown,
                ),]
            )
              ,),
            ]
          ),
          Divider(),
          new ListTile(

            title: Text("Add a person to group",style:
              TextStyle(fontSize: 25.0,
                color: Colors.black ,
                  shadows: [ Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.brown
                  ),
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 8.0,
                      color: Colors.brown,
                    ),]
              ),),
            trailing: IconButton(icon:IconShadowWidget(Icon(Icons.add,
                color: Colors.black38, size: 36)),
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
                  leading:Icon(Icons.person_outline,size: 25.0,) ,
                  title: Text(contact.getName()==''?contact.getPhoneno():contact.getName(),style: TextStyle(fontSize: 22.0,color: Colors.brown
                      ,shadows: [ Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 8.0,
                      color: Colors.brown
                  ),
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 8.0,
                    color: Colors.brown,
                  ),]
                ),),
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
