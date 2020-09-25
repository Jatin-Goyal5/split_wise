import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/screen/splitType.dart';

import '../MyNavigator.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';


class Group_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final group = Provider.of<GroupData>(context);

    return  Padding(

      padding: const EdgeInsets.only(bottom:20.0),

         // f Neumorphic (may be convex, flat & emboss)

        child: Neumorphic(
          style: NeumorphicStyle(
            border: NeumorphicBorder(
              color: Color(0x33000000),
              width: 0.8,
            )
    ),
          child: new ListTile(
            onTap: (){
              MyNavigator.goToSplitType(context,group.groupName);
            },
           // contentPadding:const EdgeInsets.all(10.0),
            leading:NeumorphicIcon(Ionicons.ios_people,size: 50.0,
            style: NeumorphicStyle(
              depth: 4,
              color: Colors.black, //customize color here
            ),),
            title: NeumorphicText(group.groupName,
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.white, //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: NeumorphicText(group.expenseType,
              style: NeumorphicStyle(
                depth: 4,
                color: Colors.white, //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 10,
              ),
            ),


      ),
        ),
    );
  }
}




