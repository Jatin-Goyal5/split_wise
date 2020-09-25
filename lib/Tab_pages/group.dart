import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:split_wise/provider/groupsData.dart';
import 'package:split_wise/widget/group_card.dart';

import '../MyNavigator.dart';
import '../main.dart';
class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {

  @override
  Widget build(BuildContext context) {
    final groupsData = Provider.of<GroupsData>(context);
    final groups = groupsData.getGroup();
    return Scaffold(
      body: groups.length == 0?new Center(child:Text(" Tap below add button to start a group"))
          : ListView.builder(

      padding: EdgeInsets.all(7.0),
      shrinkWrap: true,
      itemCount: groups.length,
    itemBuilder: (context, i)=>ChangeNotifierProvider.value(
      value: groups[i],
      child: Slidable(
          child: Group_card(),
        secondaryActions: [
          NeumorphicButton(child: Icon(AntDesign.deleteusergroup),
            onPressed: (){

              groupsData.deletegroup(groups[i]);
            },),
        ],
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
      ),
    ),

        ),
      floatingActionButton: NeumorphicFloatingActionButton(
        child: Icon(Icons.add, size: 30),
    onPressed: () {

        MyNavigator.goToCreateGroup(context);

        },
            ),





    );
  }
}
