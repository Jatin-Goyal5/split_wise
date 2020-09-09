import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:split_wise/data/friendListphone.dart';

class Friend_tile extends StatelessWidget {
  final int index;
  Friend_tile(this.index);
  @override
  Widget build(BuildContext context) {
    Contact contact = contacts[index];
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [

            BoxShadow(
              blurRadius: 90.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: Offset(
                15.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
              color: Colors.blueGrey
            )
          ],
        ),
        child: new ListTile(
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

        ),
      ),
    );

  }
}
