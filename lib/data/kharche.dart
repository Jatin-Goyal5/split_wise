import 'package:flutter/material.dart';

class Kharche with ChangeNotifier{
  String payer;
  String desc="";
  int amt;
  Kharche(this.desc,this.amt,this.payer);
// int getAmt(){
//     return _amt;
// }
// String descRiption(){
//   return _desc;
// }
// String getPayer(){
//   return _payer;
// }
}