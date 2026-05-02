
import 'package:demo/events_ui/contribution_data.dart';
import 'package:demo/events_ui/donor_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExportReportsScreen extends StatelessWidget {
  const ExportReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contributionData = Provider.of<ContributionData>(context);
    final donorData = Provider.of<DonorData>(context);

    final totalContributions = contributionData.contributions.fold(0.0, (sum, item) => sum + item.amount);
    final totalDonors = donorData.donors.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Reports'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildReportCard(
              title: 'Event Summary',
              icon: Icons.bar_chart,
              color: Colors.deepPurple,
              child: Column(
                children: [
                  _buildSummaryRow('Total Contributions', '\u20B9${totalContributions.toStringAsFixed(2)}'),
                  _buildSummaryRow('Total Donors', totalDonors.toString()),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Add logic to export data (e.g., as a CSV file)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting data...')),
                );
              },
              icon: const Icon(Icons.download),
              label: const Text('Export as CSV'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.5, height: 24),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
