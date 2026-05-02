import 'package:demo/alerts/functions.dart';
import 'package:flutter/material.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Village Alerts'),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAlertCard(
            icon: Icons.event_available_outlined,
            title: 'Private Functions & Parties',
            content: 'Related to Family Functions, it is mainly used for inviting the villagers for Function',
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FunctionScreen()),
              );
            },
          ),
          _buildAlertCard(
            icon: Icons.gavel,
            title: 'Government Announcements',
            content: 'New welfare schemes, election notices, ration distribution dates. Notification linked with scheme details or application guides.',
            color: Colors.blue,
          ),
          _buildAlertCard(
            icon: Icons.cloud,
            title: 'Weather Alerts',
            content: 'Rain or storm warnings, ideal farming conditions, crop safety tips. Alerts fetched automatically from weather API.',
            color: Colors.green,
          ),
          _buildAlertCard(
            icon: Icons.newspaper,
            title: 'Daily Local News & Panchayat Updates',
            content: 'Panchayat decisions, construction projects, job vacancies, etc.',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({required IconData icon, required String title, required String content, required Color color, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 40.0),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                content,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
