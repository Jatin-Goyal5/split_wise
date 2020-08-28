import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:split_wise/data/friendListphone.dart';
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
      itemBuilder: (context,index){
        Contact contact = contacts[index];

        return new ListTile(
          title: Text(contact.displayName != null ?contact.displayName:'' ),
          subtitle:  Text(
              contact.phones.length > 0 ? contact.phones.elementAt(0).value : ''
          ),
            leading: (contact.avatar != null && contact.avatar.length > 0) ?
            CircleAvatar(
              backgroundImage: MemoryImage(contact.avatar),
            ) : CircleAvatar(
              child: Text(contact.initials()),
            ),
          onTap: (){
            print(contact.phones.elementAt(0).value );
          },

        );
      }

    )
    );
  }


}
