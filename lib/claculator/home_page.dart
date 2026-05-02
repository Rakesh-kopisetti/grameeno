import 'package:demo/claculator/history_file.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:share_plus/share_plus.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCompound = false;
  final TextEditingController principalController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  DateTime? givenDate;
  DateTime? returnDate;
  String result = '';

  Future<void> _selectDate(BuildContext context, bool isReturnDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isReturnDate) {
          returnDate = picked;
        } else {
          givenDate = picked;
        }
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'Select Date';
    return DateFormat('dd - MM (MMM) - yyyy').format(date);
  }

  Widget decoratedInput({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black26,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: child,
        ),
      ),
    );
  }

  void calculateInterest() {
    double principal = double.tryParse(principalController.text) ?? 0;
    double interestRatePerMonth = double.tryParse(interestController.text) ?? 0;

    if (givenDate == null || returnDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Center(child: Text('🚫 Invalid Details!')),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.blueAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    int totalDays = returnDate!.difference(givenDate!).inDays;
    int years = totalDays ~/ 365;
    int remainingDaysAfterYears = totalDays % 365;
    int months = remainingDaysAfterYears ~/ 30;
    int days = remainingDaysAfterYears % 30;

    double interestPerDay = (interestRatePerMonth / 100 * principal) / 30;

    double interest = isCompound
        ? principal * (pow(1 + (interestRatePerMonth / 100 / 30), totalDays)) - principal
        : interestPerDay * totalDays;

    double total = principal + interest;

    final resText =
        '${isCompound ? 'Compound Interest' : 'Simple Interest'}\n'
        'Duration: $years years, $months months, $days days\n'
        'Total Interest: ₹${interest.toStringAsFixed(2)}\n'
        'Total Amount to Pay: ₹${total.toStringAsFixed(2)}';

    setState(() {
      result = resText;

      historyList.add(
        HistoryEntry(
          name: 'Result on ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
          givenDate: DateFormat('dd/MM/yyyy').format(givenDate!),
          returnDate: DateFormat('dd/MM/yyyy').format(returnDate!),
          resultDetails: resText,
        ),
      );
    });
  }

  

  void shareResult() {
    if (result.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No result to share!')),
      );
      return;
    }
    Share.share(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        centerTitle: true,
        
        title: const Text(
          'Interest Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: 360,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ToggleButtons(
                      isSelected: [!isCompound, isCompound],
                      onPressed: (index) => setState(() => isCompound = index == 1),
                      borderRadius: BorderRadius.circular(30),
                      selectedColor: Colors.white,
                      fillColor: Colors.blue.shade800,
                      color: Colors.blue.shade800,
                      children: const [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Simple')),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Compound')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  decoratedInput(
                    child: TextField(
                      controller: principalController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Principal Amount',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  decoratedInput(
                    child: TextField(
                      controller: interestController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Interest per Month (%)',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  decoratedInput(
                    child: InkWell(
                      onTap: () => _selectDate(context, false),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Given Date',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                        child: Text(formatDate(givenDate), style: const TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                  decoratedInput(
                    child: InkWell(
                      onTap: () => _selectDate(context, true),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Return Date',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                        child: Text(formatDate(returnDate), style: const TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: calculateInterest,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent.shade700,
                          foregroundColor: Colors.blue.shade900,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                        ),
                        child: const Text(
                          'CALCULATE',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (result.isNotEmpty)
              Container(
                width: 360,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        result,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.save, color: Colors.white),
                          tooltip: 'Save',
                          onPressed: () async {
                            String? entryName = await showDialog<String>(
                              context: context,
                              builder: (context) {
                                final nameController = TextEditingController();
                                return AlertDialog(
                                  title: const Text('Save Calculation'),
                                  content: TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(labelText: 'Enter a name'),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('CANCEL'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        final name = nameController.text.trim();
                                        if (name.isNotEmpty) {
                                          Navigator.pop(context, name);
                                        }
                                      },
                                      child: const Text('SAVE'),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (entryName != null && entryName.isNotEmpty) {
                              savedList.add(
                                HistoryEntry(
                                  name: entryName,
                                  givenDate: DateFormat('dd/MM/yyyy').format(givenDate!),
                                  returnDate: DateFormat('dd/MM/yyyy').format(returnDate!),
                                  resultDetails: result,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Saved as "$entryName"!')),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.white),
                          tooltip: 'Share',
                          onPressed: shareResult,
                        ),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
