import 'package:flutter/material.dart';

class HistoryEntry {
  final String name;
  final String givenDate;
  final String returnDate;
  final String resultDetails;

  HistoryEntry({
    required this.name,
    required this.givenDate,
    required this.returnDate,
    required this.resultDetails,
  });
}

List<HistoryEntry> historyList = [];
List<HistoryEntry> savedList = []; 
