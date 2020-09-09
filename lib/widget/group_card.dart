import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/screen/splitType.dart';

import '../main.dart';

class Group_card extends StatelessWidget {
  final int index;
  final String groupname;
  final String groupexpense;
  Group_card(this.index,this.groupname,this.groupexpense);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [

            BoxShadow(
              blurRadius: 80.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                3.0, // Move to right   horizontally
                1.0, // Move to bottom  Vertically
              ),
              color: Colors.blueGrey
            )
          ],
        ),
        child: new ListTile(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => expenseType(ind: index,),
                ));
          },
          contentPadding:const EdgeInsets.all(20.0),
          leading:IconShadowWidget(Icon(Icons.group,
              size: 36),
            showShadow: true,
          ),
          title: Text(groupname,style: TextStyle(
            fontSize: 20.0,color: Colors.black ,

          ),
          ),
          subtitle: Text(groupexpense,style: TextStyle(fontSize: 15.0,
              color: Colors.black ,
          ),
          ),

        ),
      ),
    );
  }
}
