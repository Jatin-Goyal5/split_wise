import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    // final groupsData = Provider.of<GroupsData>(context);
    // final groups = groupsData.getGroup();
    return Scaffold(
      body: ListView.builder(

      padding: EdgeInsets.all(7.0),
      shrinkWrap: true,
      itemCount: groups.length,
      itemBuilder: (context, i) {
        return Group_card(i, groups[i].getGroupname(),groups[i].getExpenseType());
      },
        ),
      floatingActionButton:FloatingActionButton(

        child: Icon(Icons.add,),
        onPressed: (){
        MyNavigator.goToCreateGroup(context);

        },
            ),





    );
  }
}
