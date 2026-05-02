import 'package:demo/events_ui/admin_folder/add_members.dart';
import 'package:demo/events_ui/admin_folder/announce.dart';
import 'package:demo/events_ui/admin_folder/export_reports.dart';
import 'package:demo/events_ui/admin_folder/view_all_activity.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _dashboardCard(
              context,
              title: 'Announce the Event',
              icon: Icons.announcement,
              color: Colors.yellow,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AnnounceEventPage()));
              },
            ),
            SizedBox(height:20),
            _dashboardCard(
              context,
              title: 'Add Committee Members',
              icon: Icons.person_add,
              color: Colors.red,
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const AddMembersScreen()));
              },
            ),
            SizedBox(height: 20),
            _dashboardCard(
              context,
              title: 'Export Reports',
              icon: Icons.picture_as_pdf,
              color: Colors.indigo,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ExportReportsScreen()));
              },
            ),
            SizedBox(height: 20),
            _dashboardCard(
              context,
              title: 'View All Activity',
              icon: Icons.analytics,
              color: Colors.purple,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewAllActivityScreen()));
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
