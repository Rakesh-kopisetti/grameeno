import 'package:demo/events_ui/contribution_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewContributionsScreen extends StatelessWidget {

  ViewContributionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contributions = Provider.of<ContributionData>(context).contributions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Contributions'),
        backgroundColor: Colors.indigo,
      ),
      body: contributions.isEmpty
          ? const Center(
              child: Text(
                'No contributions found.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: contributions.length,
              itemBuilder: (context, index) {
                final contribution = contributions[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.indigo,
                      size: 40,
                    ),
                    title: Text(
                      contribution.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Amount: \u20B9${contribution.amount.toStringAsFixed(2)}\nDate: ${contribution.date.day}/${contribution.date.month}/${contribution.date.year}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
    );
  }
}