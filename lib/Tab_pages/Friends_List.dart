import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:split_wise/data/friendListphone.dart';
import 'package:split_wise/widget/friend_tile.dart';
class friend_list extends StatefulWidget {
  @override
  _friend_listState createState() => _friend_listState();
}

class _friend_listState extends State<friend_list> {
  @override
  void initState(){
    super.initState();
    getPermissions();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  // get permission for contacts
  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllcontacts();

    }
  }


  // get list of contacts

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

    body:ListView.builder(
      shrinkWrap: true,
      itemCount: contacts.length,
      itemBuilder: (context,index)=>Friend_tile(index),

    )
    );
  }


}
