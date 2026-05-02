import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy & Permissions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text("📌 Data Usage", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text("We use your profile and location data to provide localized weather updates, nearby help centers, and subsidies."),
            SizedBox(height: 20),
            Text("🔐 Permissions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text("Location: To show nearby agricultural resources.\nCamera: For uploading pest images.\nStorage: To save crop reports."),
          ],
        ),
      ),
    );
  }
}
