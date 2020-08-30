import 'dart:math';

import 'package:split_wise/algorithm/ansdetail.dart';
import 'package:split_wise/main.dart';
class Pair{
  String name;
  int amount;
  Pair(this.name, this.amount);
}
// class Person_compar{
//   bool operator()(Pair p1, Pair p2){
//     return
//   }
// }
List<ansDetail> settleUp(int i) {
  Comparator<Pair> amountComparator = (a, b) => a.amount.compareTo(b.amount);
  List<Pair> m = List();

  //m.sort(amountComparator);
  List<ansDetail> ansTrans= List();
  groups[i].trans.forEach((key,value){
    String person = key;
    int amt = value;
    if(value !=0 ){
      m.add(new Pair(person, amt));
      m.sort(amountComparator);
    }
  });
  m.sort(amountComparator);
  while(m.length>0){
    Pair start = m.first;
    Pair end = m.last;

    int debit = start.amount;
    String debitName = start.name;

    int credit = end.amount;
    String creditName = end.name;

    // pop

    m.remove(start);
    m.remove(end);

    int settleamt= min(-debit,credit);
    debit += settleamt;
    credit -= settleamt;

    // add in ans
    ansTrans.add(new ansDetail(debitName, settleamt, creditName));

    if(debit >0){
      m.add(new Pair(debitName,debit));
    }


    if(credit > 0){
      m.add(new Pair(creditName,credit));
    }
  }

  return ansTrans;

}
