import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:split_wise/data/friendListphone.dart';

class Friend_tile extends StatelessWidget {
  final int index;
  Friend_tile(this.index);
  @override
  Widget build(BuildContext context) {
    Contact contact = contacts[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
    );

  }
}
