import 'package:flutter/material.dart';

class ViewAllActivityScreen extends StatelessWidget {
  const ViewAllActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      _Activity(time: '10:00 AM', description: 'Event setup begins', icon: Icons.build),
      _Activity(time: '12:00 PM', description: 'Lunch for volunteers', icon: Icons.fastfood),
      _Activity(time: '02:00 PM', description: 'Guest arrival', icon: Icons.people),
      _Activity(time: '03:00 PM', description: 'Main ceremony starts', icon: Icons.celebration),
      _Activity(time: '05:00 PM', description: 'Closing remarks', icon: Icons.mic),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Event Activity'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return _buildActivityTile(activity, index == activities.length - 1);
        },
      ),
    );
  }

  Widget _buildActivityTile(_Activity activity, bool isLast) {
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
                  color: Colors.amber,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.amber,
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
                    leading: Icon(activity.icon, color: Colors.amber, size: 28),
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

class _Activity {
  final String time;
  final String description;
  final IconData icon;

  _Activity({required this.time, required this.description, required this.icon});
}
