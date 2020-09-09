import 'package:flutter/material.dart';
import 'package:split_wise/Tab_pages/group.dart';
import 'package:split_wise/data/groupdata.dart';

class GroupsData extends ChangeNotifier{
  List<GroupData> _groups=[];

  List<GroupData> getGroup(){
    return [..._groups];
  }

  void addGroup(){
    //_groups.add();
  }

}