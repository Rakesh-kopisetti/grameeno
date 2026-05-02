
import 'package:demo/events_ui/activity_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnowAboutEventScreen extends StatelessWidget {
  const KnowAboutEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityProvider = Provider.of<ActivityData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Schedule'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: activityProvider.activities.length,
        itemBuilder: (context, index) {
          final activity = activityProvider.activities[index];
          return _buildActivityTile(activity, index == activityProvider.activities.length - 1);
        },
      ),
    );
  }

  Widget _buildActivityTile(Activity activity, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.cyan,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.time,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(activity.icon, color: Colors.cyan, size: 28),
                    title: Text(activity.description, style: const TextStyle(fontSize: 16)),
                  ),
                ),
                if (!isLast) const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}