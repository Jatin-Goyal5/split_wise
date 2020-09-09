
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_wise/MyNavigator.dart';
import 'package:split_wise/data/friendListphone.dart';
import 'package:split_wise/data/people.dart';

class peopleList extends StatefulWidget {
  @override
  _peopleListState createState() => _peopleListState();
}

class _peopleListState extends State<peopleList> {

  List<bool> _selected = List.generate(contacts.length, (i) => false);

  String s="";
  List<People>mu=[new People("8585937950","You"),];
  String name ="";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Row(
          children: <Widget>[
            Text("add peole to group"),
            SizedBox(width: 30.0,height: 20.0,),
            FlatButton(
              child: Text("Done"),
              onPressed: (){
                Navigator.pop(context, mu);
                },
            )
          ],
        ),
      ),
        body:ListView.builder(
            shrinkWrap: true,
            itemCount: contacts.length,
            itemBuilder: (context,index){
              Contact contact = contacts[index];
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _selected[index] ? Colors.lightBlueAccent : Colors.white,
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
                     s=contact.phones.length > 0 ? (contact.phones.elementAt(0).value): '';
                     name = contact.displayName != null ?contact.displayName:'';
                     mu.add(new People(s,name));
                     setState(() => _selected[index] = !_selected[index]);
                    },
                  ),
                ),
              );
            }

        )
    );
  }
}
