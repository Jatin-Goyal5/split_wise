
import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
  static void goToGroup(BuildContext context) {
    Navigator.pushNamed(context, "/group");
  }
  static void goToMenu(BuildContext context) {
    Navigator.pushNamed(context, "/tab");
  }
  static void goToaddPeople(BuildContext context) {
    Navigator.pushNamed(context, "/People");
  }

  static void goToSplitType(BuildContext context) {
    Navigator.pushNamed(context, "/split");
  }
}