import 'package:flutter/material.dart';
import 'package:split_wise/Tab_pages/group.dart';
import 'package:split_wise/data/groupdata.dart';

class GroupsData extends ChangeNotifier{


  List<GroupData> _groups=[

  ];

  List<GroupData> getGroup(){
    return [..._groups];
  }

  void addGroup(GroupData groupData){
    //_groups.add();
    final newGroup = GroupData(
        groupData.groupName,
        groupData.expenseType,groupData.people
    );

    _groups.add(newGroup);

    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }
  void deletegroup(GroupData groupData){

    _groups.remove(groupData);

    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }


  GroupData findByid(String nameid){
    return _groups.firstWhere((groupdata)=> groupdata.groupName == nameid);
  }


}