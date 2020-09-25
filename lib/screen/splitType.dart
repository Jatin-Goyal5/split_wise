import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:split_wise/data/kharche.dart';
import 'package:split_wise/provider/groupsData.dart';


import '../MyNavigator.dart';
class expenseType extends StatefulWidget {

 @override
  _expenseTypeState createState() => _expenseTypeState();
}

class _expenseTypeState extends State<expenseType> {

  @override
  Widget build(BuildContext context) {
    final cgroupid =ModalRoute.of(context).settings.arguments as String;
    final loadgroup = Provider.of<GroupsData>(context).findByid(cgroupid);

   return new Scaffold(
      appBar: NeumorphicAppBar(

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


          child: new ListTile(

            title:  new Center(child:Icon(AntDesign.codepen,size: 100.0)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new NeumorphicButton(


                    child: Text("Settle UP",style: TextStyle(
                      fontSize: 18.0,
                    ),
                    )
                   ,onPressed: (){
                    setState(() {
                      MyNavigator.goToSettle(context,loadgroup.groupName);

                    });

                  },),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new NeumorphicButton(child:  Text("Balances",
                    style: TextStyle(fontSize: 18.0,),
                  ),
                   onPressed: (){},),
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
            itemCount: loadgroup.getKharcheList().length,
            itemBuilder:(context,index)=>ChangeNotifierProvider.value(
            value: loadgroup.getKharcheList()[index],

              // Kharche kh = loadgroup.getKharcheList()[index];
              child: Column(
                children: <Widget>[

                  new ListTile(
                    title: Text(loadgroup.getKharcheList()[index].desc, style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text(loadgroup.getKharcheList()[index].payer+"   "+loadgroup.getKharcheList()[index].amt.toString()),
                    leading: CircleAvatar(
                      maxRadius: 30.0,
                      child: Text(loadgroup.getKharcheList()[index].desc[0]),
                    ),
                    onTap: (){


                    },
                  ),

                ],
              )

          ),
          )

    ]

      ),
      floatingActionButton: NeumorphicFloatingActionButton(

        child: Icon(Icons.add),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ///
        ),
        onPressed: (){
          setState(() {
            MyNavigator.goToaddBill(context,loadgroup.groupName);
          });
        },

      ),
    );
  }
}
