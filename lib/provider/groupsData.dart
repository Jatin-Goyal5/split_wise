import 'package:flutter/material.dart';
import 'package:split_wise/Tab_pages/group.dart';

class GroupsData extends ChangeNotifier{
  List<GroupsData> _groups=[];

  List<GroupsData> getGroup(){
    return [..._groups];
  }

}