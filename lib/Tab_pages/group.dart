import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/Tab_pages/create_Group.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/screen/splitType.dart';

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
          return Card(
            color: Colors.blueAccent,
            child: new ListTile(
              onTap: (){
//                List<People> po=group.getPeopleList();
//                for(int i =0 ; i< po.length; i++)
//                  print(po[i].phoneNo);
//                print(index);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => expenseType(ind: index,),
                    ));
              },
              contentPadding: EdgeInsets.all(15.0),
              leading: Icon(Icons.group,size: 20.0,),
              title: Text(group.getGroupname(),style: TextStyle(fontSize: 20.0,color: Colors.white ),),
              subtitle: Text(group.getExpenseType(),style: TextStyle(fontSize: 15.0,color: Colors.white ),),
            ),

          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          ListView(
            children: <Widget>[

              GroupList(),
              new RaisedButton(
                onPressed: (){
                  MyNavigator.goToHome(context);
                },
                child: Text("Create a new Group"),
              )
            ],
          ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: IconButton(
          icon: Icon(Icons.add,size: 20.0,color: Colors.white,)
        ),
      ),
    );
  }
}
