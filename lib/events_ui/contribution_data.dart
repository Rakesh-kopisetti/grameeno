

import 'package:flutter/foundation.dart';

// Data model for a contribution
class Contribution {
  final String id;
  final String name;
  final double amount;
  final DateTime date;

  Contribution({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
  });
}

// Singleton class to manage contribution data
class ContributionData extends ChangeNotifier {
  static final ContributionData _instance = ContributionData._internal();

  factory ContributionData() {
    return _instance;
  }

  ContributionData._internal();

  final List<Contribution> _contributions = [];

  List<Contribution> get contributions => _contributions;

  void addContribution({required String name, required double amount}) {
    _contributions.add(
      Contribution(
        id: 'TXN${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        amount: amount,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
