import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:neumorphic/neumorphic.dart';
import 'package:split_wise/Tab_pages/Friends_List.dart';
import 'package:split_wise/Tab_pages/activity.dart';
import 'package:split_wise/Tab_pages/appDrawer.dart';
import 'package:split_wise/Tab_pages/group.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentTab =0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      friend_list(),
      Group(),
      activity()
    ];
    final _kTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon:Icon(Icons.contact_phone,color: Colors.black,),title: Text("friends")),
      BottomNavigationBarItem(icon:Icon(Icons.group_add,color: Colors.black,),title: Text("Group")),
      BottomNavigationBarItem(icon:Icon(Icons.person_outline,color: Colors.black,),title: Text("Account"))

    ];
    assert(_kTabPages.length == _kTabs.length);
    final bottomNavBar = BottomNavigationBar(

      items: _kTabs,
      currentIndex: _currentTab,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentTab=index;
        });
      },
      elevation: 0,
      backgroundColor: Color(0xffDDDDDD),

    );


    return Scaffold(

      appBar: NeumorphicAppBar(
        textStyle: GoogleFonts.mcLaren(),
        title: NeumorphicText("S p l i t w i s e .",

           style: NeumorphicStyle(
             intensity: 1,
             depth:15.0,
             surfaceIntensity: 8,
             shadowLightColor: Color(0xffFFFFFF),
             color: Colors.black,
             shadowLightColorEmboss: Colors.blue//customize color here
           ),
           textStyle: NeumorphicTextStyle(
             fontSize: 38,
             fontWeight: FontWeight.bold,
             fontFamily: "lato"
           ),
         ),
        titleSpacing: 10.0,

      ),
     body: _kTabPages[_currentTab],

      bottomNavigationBar:bottomNavBar
    );


  }
}
