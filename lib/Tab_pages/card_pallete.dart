import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/Tab_pages/Friends_List.dart';
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
      Center(child: Text("ACTIVITY",style: TextStyle( color: Colors.teal,fontSize: 20.0))),
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
    );


    return Scaffold(
      appBar: AppBar(title: Text("Spltwise"),),
     body: _kTabPages[_currentTab],

      bottomNavigationBar:bottomNavBar
    );


  }
}
