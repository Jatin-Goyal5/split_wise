import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return  ClipRRect(

      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.purpleAccent,
        child: new ListTile(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => expenseType(ind: index,),
                ));
          },
          contentPadding:const EdgeInsets.all(15.0),
          leading: Icon(Icons.group,size: 50.0,),
          title: Text(groupname,style: TextStyle(fontSize: 20.0,color: Colors.black ,fontWeight: FontWeight.w500),),
          subtitle: Text(groupexpense,style: TextStyle(fontSize: 15.0,color: Colors.white ),),

        ),
      ),
    );
  }
}
