import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:split_wise/Tab_pages/Friends_List.dart';
import 'package:split_wise/Tab_pages/group.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      friend_list(),
      Group(),
      Center(child: Text("ACTIVITY",style: TextStyle( color: Colors.teal,fontSize: 20.0))),
    ];
    final _kTabs = <Tab>[
      Tab(child:Text("FRIENDS",style: TextStyle( color: Colors.teal,fontSize: 20.0))),
      Tab(child:  Text("GROUP",style: TextStyle( color: Colors.teal,fontSize: 20.0))),
      Tab(child: Text("ACTIVITY",style: TextStyle( color: Colors.teal,fontSize: 20.0)))

    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('S P L I T W I S E'),titleSpacing: 30.0,
          leading: Icon(Icons.list),
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );


  }
}
