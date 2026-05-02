import 'package:flutter/foundation.dart';

// Data model for an expenditure
class Expenditure {
  final String reason;
  final double amount;
  final DateTime date;

  Expenditure({required this.reason, required this.amount, required this.date});
}

// Manages expenditure data
class ExpenditureData extends ChangeNotifier {
  final List<Expenditure> _expenditures = [];

  List<Expenditure> get expenditures => _expenditures;

  void addExpenditure({required String reason, required double amount}) {
    _expenditures.add(
      Expenditure(
        reason: reason,
        amount: amount,
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
