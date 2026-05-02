import 'package:demo/events_ui/committee/manage_donors.dart';
import 'package:demo/events_ui/committee/schedule_event.dart';
import 'package:demo/events_ui/committee/view_contributions.dart';
import 'package:demo/events_ui/committee/fund_usage.dart';
import 'package:flutter/material.dart';

class CommitteeDashboard extends StatelessWidget {
  const CommitteeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(title: Text('Committee Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _dashboardCard(
              context,
              title: 'View Contributions',
              icon: Icons.history,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewContributionsScreen()),
                );
              },
            ),
            SizedBox(height: 40),
            _dashboardCard(
              context,
              title: 'Update Fund Usage',
              icon: Icons.edit,
              color: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FundUsageScreen()),
                );
              },
            ),
            SizedBox(height: 40),
            _dashboardCard(
              context,
              title: 'Manage Donors',
              icon: Icons.people,
              color: Colors.brown,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageDonors()),
                );
              },
            ),
            SizedBox(height: 40),
            _dashboardCard(
              context,
              title: 'Schedule the Event',
              icon: Icons.schedule,
              color: Colors.pink,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleEventPage()));
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
              SizedBox(width: 20),
              Icon(icon, size: 40, color: color),
              SizedBox(width: 20),
              Text(title, style: TextStyle(fontSize: 20, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
