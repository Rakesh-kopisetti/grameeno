
import 'package:flutter/material.dart';

class CommitteeMemberData extends ChangeNotifier {
  final List<String> _committeeMembers = [
    'Nitya',
    'Kiran',
    'Siva',
    'Bhanu',
    'Raki',
  ];

  List<String> get committeeMembers => _committeeMembers;

  void addMember(String name) {
    _committeeMembers.add(name);
    notifyListeners();
  }

  void removeMember(int index) {
    _committeeMembers.removeAt(index);
    notifyListeners();
  }
}
