import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/Tab_pages/Friends_List.dart';

import 'package:split_wise/Tab_pages/group.dart';
import 'package:split_wise/algorithm/settleTrans.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/screen/addBill.dart';
import 'package:split_wise/screen/peoplelist.dart';
import 'package:split_wise/provider/groupsData.dart';
import 'package:split_wise/screen/create_Group.dart';
import 'package:split_wise/screen/splitType.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Tab_pages/card_pallete.dart';
import 'data/groupdata.dart';
var routes = <String, WidgetBuilder>{
  "/createGroup": (BuildContext context) => CreateGroup(),
  "/friend": (BuildContext context) => friend_list(),
  "/group": (BuildContext context) => Group(),
  "/tab": (BuildContext context) => Menu(),
  "/addBill": (BuildContext context)=> addBill(),

  "/People": (BuildContext context) => peopleList(),
  "/split":(BuildContext context) => expenseType(),
  "/settle":(BuildContext context) => settleTrans(),

};
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
        value :GroupsData()),
      ],
        child: NeumorphicApp(

          themeMode: ThemeMode.light, //or dark / system
          darkTheme: NeumorphicThemeData(
            baseColor: Color(0xff333333),
            accentColor: Colors.green,
            lightSource: LightSource.topLeft,
            depth: 80,
            intensity: 0.8,
          ),
          theme: NeumorphicThemeData(
            baseColor: Color(0xffDDDDDD),
            accentColor: Colors.cyan,
            lightSource: LightSource.topLeft,
            depth: 6,
            intensity: 0.5,
              textTheme:GoogleFonts.mcLarenTextTheme(
                Theme.of(context).textTheme,),
            shadowLightColor: Colors.black38
          ),
           debugShowCheckedModeBanner: false,



          home: Menu(),
          routes: routes,
        ),

    );
  }
}

