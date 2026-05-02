
import 'package:flutter/material.dart';

class Donor {
  final String name;
  final String donation;

  Donor({required this.name, required this.donation});
}

class DonorData extends ChangeNotifier {
  final List<Donor> _donors = [];

  List<Donor> get donors => _donors;

  void addDonor(Donor donor) {
    _donors.add(donor);
    notifyListeners();
  }
}
