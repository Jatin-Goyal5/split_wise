
import 'package:flutter/material.dart';

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

  static void goToSplitType(BuildContext context) {
    Navigator.pushNamed(context, "/split");
  }
  static void goToSettle(BuildContext context) {
    Navigator.pushNamed(context, "/settle");
  }
}