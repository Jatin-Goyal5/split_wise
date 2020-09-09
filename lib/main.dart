import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/Tab_pages/Friends_List.dart';

import 'package:split_wise/Tab_pages/group.dart';
import 'package:split_wise/algorithm/settleTrans.dart';
import 'package:split_wise/data/peoplelist.dart';
import 'package:split_wise/provider/groupsData.dart';
import 'package:split_wise/screen/create_Group.dart';
import 'package:split_wise/screen/splitType.dart';

import 'Tab_pages/card_pallete.dart';
import 'data/groupdata.dart';
var routes = <String, WidgetBuilder>{
  "/createGroup": (BuildContext context) => CreateGroup(),
  "/friend": (BuildContext context) => friend_list(),
  "/group": (BuildContext context) => Group(),
  "/tab": (BuildContext context) => Menu(),
  "/People": (BuildContext context) => peopleList(),
  "/split":(BuildContext context) => expenseType(),
  "/settle":(BuildContext context) => settleTrans(),

};
void main() {
  runApp(MyApp());
}
List<GroupData> groups=[];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>GroupsData(),
      child: MaterialApp(

        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.grey,
          primarySwatch: Colors.brown,
          accentColor: Colors.black54,
          fontFamily: 'Lato',

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Menu(),
        routes: routes,
      ),
    );
  }
}

