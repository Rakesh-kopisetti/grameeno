import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<Map<String, String>> dos = [
    {
      'icon': '🧪',
      'text': 'Test soil before fertilizer use – Know the nutrient needs.',
    },
    {
      'icon': '⏰',
      'text': 'Use the recommended dose and timing – Avoid under/overuse.',
    },
    {
      'icon': '♻️',
      'text': 'Mix organic and chemical fertilizers – For sustainable growth.',
    },
    {
      'icon': '💧',
      'text': 'Apply when soil is moist – Promotes better nutrient absorption.',
    },
    {
      'icon': '📦',
      'text': 'Store fertilizers properly – Dry, cool, and secure storage.',
    },
    {'icon': '🧤', 'text': 'Wear gloves and mask – Handle fertilizers safely.'},
    {
      'icon': '↔️',
      'text': 'Maintain proper spacing from roots – Prevent plant damage.',
    },
    {
      'icon': '🪴',
      'text': 'Fertilize as per crop stage – Match with plant needs.',
    },
  ];

  final List<Map<String, String>> donts = [
    {
      'icon': '🚫',
      'text': 'Don’t overuse fertilizers – It can harm the soil and crops.',
    },
    {
      'icon': '⚗️',
      'text': 'Don’t mix incompatible fertilizers – Can reduce effectiveness.',
    },
    {
      'icon': '🌵',
      'text': 'Don’t apply on dry soil – Reduces absorption and efficiency.',
    },
    {
      'icon': '🌧️',
      'text': 'Don’t fertilize before rain – Nutrients can be washed away.',
    },
    {'icon': '📭', 'text': 'Don’t leave bags open – Moisture can spoil them.'},
    {
      'icon': '⏳',
      'text': 'Don’t use expired products – They lose effectiveness.',
    },
    {
      'icon': '📍',
      'text': 'Don’t apply too close to stem – May burn the plant.',
    },
    {
      'icon': '💊',
      'text': 'Don’t rely only on chemicals – Use bio-fertilizers too.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Do's & Don'ts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✅Do\'s',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          dos[index]['icon']!,
                          style: TextStyle(fontSize: 24),
                        ),
                        title: Text(
                          dos[index]['text']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    '✅Don\'ts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: donts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          donts[index]['icon']!,
                          style: TextStyle(fontSize: 24),
                        ),
                        title: Text(
                          donts[index]['text']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
