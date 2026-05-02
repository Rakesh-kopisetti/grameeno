import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About App")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Grama Sahayam App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "This app is designed to help villagers and farmers by providing:\n"
              "✅ Agricultural Support\n"
              "✅ Weather Alerts\n"
              "✅ Pest Control Tips\n"
              "✅ Health & Veterinary Services\n"
              "✅ Community Updates and Events\n\n"
              "Developed by: Team GramaTech\n"
              "Version: 1.0.0",
            ),
          ],
        ),
      ),
    );
  }
}
