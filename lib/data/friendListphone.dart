import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

List <Contact> contacts=[];
getAllcontacts() async {
  List<Contact> _contacts=   (await ContactsService.getContacts()).toList();
  contacts= _contacts;
}