import 'package:flutter/material.dart';

class EmergencyServ extends StatelessWidget {
  EmergencyServ({super.key});

  final List<Map<String, dynamic>> emergencyServices = [
    {
      'title': 'Police👮',
      'description': 'Law enforcement and\npublic safety',
      'number': '100',
      'icon': 'assets/icons/police.png',
    },
    {
      'title': 'Ambulance🚑',
      'description': 'Emergency medical assistance',
      'number': '108',
      'icon': 'assets/icons/ambulance.png',
    },
    {
      'title': 'Fire👩‍🚒',
      'description': 'Fire emergencies and rescue....',
      'number': '101',
      'icon': 'assets/icons/fire.png',
    },
    {
      'title': 'Disaster Helpline🌊',
      'description': 'Support during natural disasters',
      'number': '112',
      'icon': 'assets/icons/disaster.png',
    },
    {
      'title': 'Women Helpline👮‍♀️',
      'description': 'Support for women in distress',
      'number': '1091',
      'icon': 'assets/icons/women.png',
    },
    {
      'title': 'Child Helpline🚸',
      'description': 'Emergency help for children',
      'number': '1098',
      'icon': 'assets/icons/child.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade200,
            const Color.fromARGB(255, 241, 245, 180),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Emergency Services",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 2, 33, 86),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/health/emergency_logo.png",
                height: 250,
                width: 200,
                fit: BoxFit.cover,
              ),
              ...emergencyServices.map((service) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service['title'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 2, 33, 86),
                                  ),
                                ),
                                Text(
                                  service['description'],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 9, 9, 9),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            service['number'],
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 2, 33, 86),
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
