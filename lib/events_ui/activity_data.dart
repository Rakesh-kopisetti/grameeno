
import 'package:flutter/material.dart';

class Activity {
  String time;
  String description;
  IconData icon;

  Activity({required this.time, required this.description, required this.icon});
}

class ActivityData extends ChangeNotifier {
  final List<Activity> _activities = [
    Activity(time: '10:00 AM', description: 'Event setup begins', icon: Icons.build),
    Activity(time: '12:00 PM', description: 'Lunch for volunteers', icon: Icons.fastfood),
    Activity(time: '02:00 PM', description: 'Guest arrival', icon: Icons.people),
    Activity(time: '03:00 PM', description: 'Main ceremony starts', icon: Icons.celebration),
    Activity(time: '05:00 PM', description: 'Closing remarks', icon: Icons.mic),
  ];

  List<Activity> get activities => _activities;

  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }

  void updateActivity(int index, Activity activity) {
    _activities[index] = activity;
    notifyListeners();
  }

  void removeActivity(int index) {
    _activities.removeAt(index);
    notifyListeners();
  }
}
