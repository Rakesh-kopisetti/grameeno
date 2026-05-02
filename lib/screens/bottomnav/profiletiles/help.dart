import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How to upload my crop report?',
      'answer': 'Go to the Agriculture section and click on "Upload Report".'
    },
    {
      'question': 'How to find nearby veterinary services?',
      'answer': 'Use the Health module to locate nearby animal doctors.'
    },
    {
      'question': 'App not loading weather?',
      'answer': 'Check your internet or GPS permissions.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Frequently Asked Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...faqs.map((faq) => ExpansionTile(
                title: Text(faq['question']!),
                children: [Padding(padding: const EdgeInsets.all(8.0), child: Text(faq['answer']!))],
              )),
          const Divider(),
          ListTile(
            title: const Text("Contact Support"),
            subtitle: const Text("Phone: +91 9876543210\nEmail: support@villageapp.in"),
            leading: const Icon(Icons.support_agent),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Calling support...")),
              );
            },
          )
        ],
      ),
    );
  }
}
