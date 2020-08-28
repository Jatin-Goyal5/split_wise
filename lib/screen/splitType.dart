import 'package:flutter/material.dart';
import 'package:split_wise/data/groupdata.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/data/people.dart';
import 'package:split_wise/main.dart';
import 'package:split_wise/screen/addBill.dart';
class expenseType extends StatefulWidget {

  final int ind;
  expenseType({Key key, @required this.ind}) : super(key: key);
  @override
  _expenseTypeState createState() => _expenseTypeState(ind);
}

class _expenseTypeState extends State<expenseType> {
  final int ind;
  _expenseTypeState(this.ind);


  @override
  Widget build(BuildContext context) {
    GroupData mygroup= groups[ind];
    List<People> mypeople = mygroup.getPeopleList();
    List<Kharche> ckharch= mygroup.getKharcheList();
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "people"
        ),
      ),
      body: ListView(

        children:<Widget>[ Container(
          color: Colors.lightBlue,
          child: new ListTile(

            title:  new Center(child:Icon(Icons.featured_play_list,size: 100.0,color: Colors.white,)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: new Row(

                children: <Widget>[
                Expanded(
                  flex:2,
                  child: new FlatButton(
                    child: Text("Settle UP",),color: Colors.red,onPressed: (){},),
                ),
                Expanded(
                  flex: 1,
                  child: Divider(
                  ),
                ),
                Expanded(
                  flex: 2,
                    child: new FlatButton(child:  Text("Balances"),color: Colors.white54,onPressed: (){},))
              ],),
            ),
          ),
        ),
          Divider(
            height: 20.0,
          ),
          Scrollbar(
          child:new ListView.builder(
            shrinkWrap: true,
            itemCount: ckharch.length,
            itemBuilder:(context,index){
              People person = mypeople[index];
              Kharche kh = ckharch[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: new ListTile(
                  title: Text(kh.descRiption(), style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  subtitle: Text(kh.getAmt().toString()),
                  leading: CircleAvatar(
                    maxRadius: 30.0,
                    child: Text(kh.descRiption()[0]),
                  ),
                  onTap: (){
                    print(groups[ind].getPeopleList()[0].getMoney());
                  },
                ),
              );
            } ,
          ),

        ),

    ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => addBill(ind: ind,),
              ));
        },
      ),
    );
  }
}
