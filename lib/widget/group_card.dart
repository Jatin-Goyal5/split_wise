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
      padding: const EdgeInsets.only(bottom:40.0),
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [

            BoxShadow(
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
              offset: Offset(
                15.0, // Move to right 10  horizontally
                15.0, // Move to bottom 10 Vertically
              ),
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
            shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 3.5,
                color:Colors.black54,
              ),
              Shadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 8.0,
                color: Colors.black12,
              ),
            ],
          ),
          ),
          subtitle: Text(groupexpense,style: TextStyle(fontSize: 15.0,
              color: Colors.black ,
          shadows: [ Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Color.fromARGB(0, 0, 0, 0),
          ),
            Shadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 3.0,
              color: Colors.black87,
            ),
            ],
          ),
          ),

        ),
      ),
    );
  }
}
