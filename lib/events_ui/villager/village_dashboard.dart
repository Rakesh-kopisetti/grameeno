import 'package:demo/events_ui/villager/donor_list.dart';
import 'package:demo/events_ui/villager/event_details.dart';
import 'package:demo/events_ui/villager/contribute_funds.dart';
import 'package:demo/events_ui/villager/know_committee.dart';
import 'package:demo/events_ui/villager/receipts.dart';
import 'package:demo/events_ui/villager/track_fund.dart';
import 'package:flutter/material.dart';

class VillagerDashboard extends StatefulWidget {
  const VillagerDashboard({super.key});

  @override
  State<VillagerDashboard> createState() => _VillagerDashboardState();
}

class _VillagerDashboardState extends State<VillagerDashboard> {
  final List<Receipt> _receipts = [];

  void _addReceipt(double amount) {
    setState(() {
      _receipts.add(
        Receipt(
          id: 'TXN${DateTime.now().millisecondsSinceEpoch}',
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptsScreen(receipts: _receipts),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(title: const Text('Villager Dashboard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _dashboardCard(
              context,
              title: 'Know About Event',
              icon: Icons.event,
              color: Colors.orange,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EventDetailsPage()));
              },
            ),
            SizedBox(height:40),
            _dashboardCard(
              context,
              title: 'Contribute Funds',
              icon: Icons.volunteer_activism,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContributeFundsScreen(
                      onAddReceipt: _addReceipt,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            _dashboardCard(
              context,
              title: 'View Receipts',
              icon: Icons.receipt_long,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReceiptsScreen(receipts: _receipts),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            _dashboardCard(
              context,
              title: 'Track Fund Usage',
              icon: Icons.track_changes,
              color: Colors.deepPurple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrackFundScreen(),
                  ),
                );
              },
            ),
             const SizedBox(height: 40),
              _dashboardCard(
              context,
              title: 'See the Donors',
              icon: Icons.volunteer_activism,
              color: Colors.pinkAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  DonorList(),
                  ),
                );
              },
            ),
              const SizedBox(height: 40),
              _dashboardCard(
              context,
              title: 'Know the Committee',
              icon: Icons.volunteer_activism,
              color: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KnowCommitteeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color.withAlpha(26),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 20),
              Text(title, style: TextStyle(fontSize: 20, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}