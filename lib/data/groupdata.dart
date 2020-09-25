import 'package:flutter/foundation.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/data/people.dart';

class GroupData with ChangeNotifier{

  Map<String ,int> trans=Map();// for settle amt
  int _no=0;
  String groupName="";
  List<People> people=[];
  List<Kharche> _kharche=[];
  String expenseType="Trip";
  int toatleamount=0;
  GroupData(this.groupName,this.expenseType,this.people);
  // void addPeople(People people){
  //   people.add(people);
  //   notifyListeners();
  // }



  List<People> getPeopleList(){
    return people;
  }
  //
  List<Kharche> getKharcheList(){
    return [..._kharche];

  }
  // void addPeople(List<People> peo){
  //    _people= peo;
  // }
  // void inc(){
  //   _no++;
  // }
  // int getIndex(){
  //   return _no;
  // }
  //
  void addKharche(Kharche kh){
    final newKharcha = Kharche(
        kh.desc,
        kh.amt,kh.payer);


    _kharche.add(newKharcha);
    notifyListeners();
  }

  void addTrans(String ans, int amount){
    if(!this.trans.containsKey(ans)){
    this.trans[ans] =0;
    }
    this.toatleamount += amount;
    double money = amount/this.people.length;
    this.trans[ans] -= amount-(money).round();

    for(int i =0 ; i < this.people.length; i++){
    String p = this.people[i].getName();
    if(p != ans){
    if(!this.trans.containsKey(p)){
    this.trans[p] = 0;
    }
    this.trans[p] += (money).round();

    }

    }
  }




}

