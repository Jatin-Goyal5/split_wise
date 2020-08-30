import 'package:flutter/foundation.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/data/people.dart';

class GroupData{


  Map<String ,int> trans=Map();
  int _no=0;
  String _groupName="Groupname";
  List<People> _people=[];
  List<Kharche> _kharche=[];
  String _expenseType="Trip";
  GroupData(this._groupName,this._expenseType,this._people);
  String getGroupname(){
    return _groupName;
  }
  String getExpenseType(){
    return _expenseType;
  }
  List<People> getPeopleList(){
    return _people;
  }

  List<Kharche> getKharcheList(){
    return _kharche;
  }
  void addPeople(List<People> peo){
     _people= peo;
  }
  void inc(){
    _no++;
  }
  int getIndex(){
    return _no;
  }

  void addKharche(String desc , int money,String payer){
    this._kharche.add(new Kharche(desc,money,payer));
  }

  void addTrans(String name, int amt){
    trans[name] =amt;
  }

}

