import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<String> notifications = const [
    "🌾 New subsidy announced for organic fertilizers!",
    "☀️ Weather Alert: High temperatures expected tomorrow.",
    "💧 Irrigation tips for current dry conditions.",
    "📢 Village meeting scheduled for 5th Aug.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.green),
            title: Text(notifications[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("You tapped: ${notifications[index]}")),
              );
            },
          );
        },
      ),
    );
  }
}
