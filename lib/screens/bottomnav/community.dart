import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _UpdatesState();
}

class _UpdatesState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Expert Recommendations\nBest crops to plant this week/monthFertilizer usage guidance Weekly reminders based on season & crop & \nFarmer Success stories\n(Inspirational stories from farmers Videos or articles about best practices, innovations)"),
      ),
    );
  }
}