import 'dart:math';
import 'package:split_wise/data/ansdetail.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/main.dart';
class Pair{
  String name;
  int amount;
  Pair(this.name, this.amount);
}

List<ansDetail> settleUp(GroupData group) {
  Comparator<Pair> amountComparator = (a, b) => a.amount.compareTo(b.amount);// sort the transactionaccording to amount
  List<Pair> m = List();
  List<ansDetail> ansTrans= List();
  group.trans.forEach((key,value){

    if(value !=0 ){
      m.add(new Pair(key, value));
      m.sort(amountComparator);
    }
  });
  m.sort(amountComparator);
  for(int i=0 ; i< m.length; i++){
    print(m[i].name);
    print(m[i].amount);
  }
  while(m.isNotEmpty){
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
    if(debitName != creditName)
      ansTrans.add(new ansDetail(debitName, settleamt, creditName));

    if(debit != 0 ){
      m.add(new Pair(debitName,debit));

      m.sort(amountComparator);
    }
    if(credit != 0 ){

      m.add(new Pair(creditName,credit));
      m.sort(amountComparator);
    }
  }

  return ansTrans;

}
