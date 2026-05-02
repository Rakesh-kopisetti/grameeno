import 'package:flutter/material.dart';
import 'package:demo/events_ui/admin_folder/admin.dart';
import 'package:demo/events_ui/committee/committee.dart';
import 'package:demo/events_ui/villager/village_dashboard.dart';


class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(title: Text('Event Management')),
      body: SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Your Role',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _roleCard(
              context,
              title: 'Villager',
              color: Colors.green[100]!,
              icon: Icons.groups,
              iconColor: Colors.green,
              screen: VillagerDashboard(),
            ),
            SizedBox(height: 16),
            _roleCard(
              context,
              title: 'Committee',
              color: Colors.orange[100]!,
              icon: Icons.groups_2,
              iconColor: Colors.orange,
              screen: CommitteeDashboard(),
            ),
            SizedBox(height: 16),
            _roleCard(
              context,
              title: 'Admin',
              color: Colors.red[100]!,
              icon: Icons.admin_panel_settings,
              iconColor: Colors.red,
              screen: AdminDashboard(),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _roleCard(
    BuildContext context, {
    required String title,
    required Color color,
    required IconData icon,
    required Color iconColor,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 28),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
