import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:split_wise/algorithm/settleTrans.dart';
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
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "People",
          style: TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children:<Widget>[ Container(
          color:Colors.grey,
          child: new ListTile(

            title:  new Center(child:IconShadowWidget( Icon(Icons.account_balance_wallet,size: 100.0),
            showShadow: true,
            shadowColor: Colors.black26,)
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                children: <Widget>[
                Expanded(
                  flex:2,
                  child:  new Container( decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [

                BoxShadow(
                  blurRadius: 35.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    15.0, // Move to right 10  horizontally
                    15.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
                    child: new FlatButton(
                      child: Text("Settle UP",style: TextStyle(
                        fontSize: 18.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color:Colors.black54,
                          ),
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 8.0,
                            color: Colors.black87,
                          ),
                        ],
                      ),
                      )
                     ,onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => settleTrans(ind: ind,),
                          ));
                    },),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Divider(
                  ),
                ),
                Expanded(
                  flex: 2,
                    child:new Container( decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [

                        BoxShadow(
                          blurRadius: 35.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            15.0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: new FlatButton(child:  Text("Balances",
                      style: TextStyle(fontSize: 18.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color:Colors.black.withOpacity(0.8),
                          ),
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 8.0,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                      color: Colors.white54,onPressed: (){},)
                    )
                )
              ],
                ),
            ),
          ),
        ),
          Divider(
            height: 20.0,
          ),
          new ListView.builder(
            shrinkWrap: true,
            itemCount: ckharch.length,
            itemBuilder:(context,index){
              People person = mypeople[index];
              Kharche kh = ckharch[index];
              return Column(
                children: <Widget>[

                  new ListTile(
                    title: Text(kh.descRiption(), style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text(kh.getPayer()+"   "+kh.getAmt().toString()),
                    leading: CircleAvatar(
                      maxRadius: 30.0,
                      child: Text(kh.descRiption()[0]),
                    ),
                    onTap: (){
                      print(groups[ind].trans[kh.getPayer()]);

                    },
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                ],
              );
            } ,
          ),

    ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

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
