import 'package:flutter/material.dart';
import 'package:demo/events_ui/contribution_data.dart';
import 'package:demo/events_ui/expenditure_data.dart';
import 'package:provider/provider.dart';

class FundUsageScreen extends StatefulWidget {
  const FundUsageScreen({super.key});

  @override
  State<FundUsageScreen> createState() => _FundUsageScreenState();
}

class _FundUsageScreenState extends State<FundUsageScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _recordExpenditure(double remainingFunds) {
    if (_formKey.currentState!.validate()) {
      final reason = _reasonController.text;
      final amount = double.parse(_amountController.text);

      if (amount > remainingFunds) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Insufficient funds!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Provider.of<ExpenditureData>(context, listen: false).addExpenditure(
        reason: reason,
        amount: amount,
      );

      _reasonController.clear();
      _amountController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Recorded \u20B9${amount.toStringAsFixed(2)} for $reason'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Usage'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<ContributionData>(
        builder: (context, contributionData, child) {
          return Consumer<ExpenditureData>(
            builder: (context, expenditureData, child) {
              final totalContributions = contributionData.contributions.fold(0.0, (sum, item) => sum + item.amount);
              final totalExpenditures = expenditureData.expenditures.fold(0.0, (sum, item) => sum + item.amount);
              final remainingFunds = totalContributions - totalExpenditures;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Contributed Funds:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u20B9${totalContributions.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Remaining Funds:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\u20B9${remainingFunds.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 24, color: remainingFunds >= 0 ? Colors.blue : Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Record New Expenditure:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _reasonController,
                            decoration: const InputDecoration(
                              labelText: 'Reason for expenditure',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a reason';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Amount Used',
                              prefixText: '\u20B9',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an amount';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => _recordExpenditure(remainingFunds),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Record Expenditure'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Expenditure History:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: expenditureData.expenditures.isEmpty
                          ? const Center(
                              child: Text(
                                'No expenditures recorded yet.',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            )
                          : ListView.builder(
                              itemCount: expenditureData.expenditures.length,
                              itemBuilder: (context, index) {
                                final expenditure = expenditureData.expenditures[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    title: Text(expenditure.reason),
                                    subtitle: Text(
                                        '\u20B9${expenditure.amount.toStringAsFixed(2)} on ${expenditure.date.day}/${expenditure.date.month}/${expenditure.date.year}'),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
