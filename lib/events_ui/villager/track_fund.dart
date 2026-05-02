import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/events_ui/contribution_data.dart';
import 'package:demo/events_ui/expenditure_data.dart';

class TrackFundScreen extends StatelessWidget {
  const TrackFundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Usage Tracker'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer2<ContributionData, ExpenditureData>(
        builder: (context, contributionData, expenditureData, child) {
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
                  'Expenditure History:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
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
      ),
    );
  }
}
