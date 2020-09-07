import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/widget/group_card.dart';

import '../MyNavigator.dart';
import '../main.dart';
class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {

  Widget GroupList(){
    return ListView.builder(

        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        itemCount: groups.length,
        itemBuilder: (context, index) {
          GroupData group = groups[index];
          return Group_card(index, group.getGroupname(),group.getExpenseType());
        },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupList(),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.deepOrangeAccent,
        hoverColor: Colors.blue,
        highlightElevation: 20.0,
        foregroundColor: Colors.red,
        child:
           Icon(Icons.add,size: 35.0,color: Colors.white,)
        ,
        onPressed: (){
          MyNavigator.goToCreateGroup(context);

        },
      ),
    );
  }
}
