
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'data/kharche.dart';

class MyNavigator {
  static void goToCreateGroup(BuildContext context) {
    Navigator.pushNamed(context, "/createGroup");
  }

  static void goToFriendList(BuildContext context) {
    Navigator.pushNamed(context, "/friend");
  }
  static void goToGroup(BuildContext context) {
    Navigator.pushNamed(context, "/group");
  }
  static void goToTab(BuildContext context) {
    Navigator.pushNamed(context, "/tab");
  }
  static void goToaddPeople(BuildContext context) {
    Navigator.pushNamed(context, "/People");
  }

  static void goToSettle(BuildContext context,String groupname) {
    Navigator.pushNamed(context, "/settle",arguments: groupname);
  }
  static void goToSplitType(BuildContext context, String groupname) {
    Navigator.pushNamed(context, "/split",arguments: groupname);
  }

  static List<Kharche> goToaddBill(BuildContext context, String groupName ) {
    Navigator.pushNamed(context, "/addBill" ,arguments: groupName);
  }

}