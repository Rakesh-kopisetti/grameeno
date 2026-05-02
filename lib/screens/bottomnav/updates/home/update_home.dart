import 'package:demo/screens/bottomnav/updates/home/news_types.dart';
import 'package:flutter/material.dart';

class UpdateHome extends StatelessWidget {
  const UpdateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Updates",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewsTypes(
              name: "MARKET",
              icon: Icons.shopping_bag_rounded,
              color: Colors.green,
              title: "Tomato Price Rise in Local Market",
              sub:
                  "Current market rate at ₹40/kg, up ₹10 from last week. Available in Mandal Market.",
              img:
                  "https://www.bing.com/th/id/OIP.QurEUPfQ6KKKIyDOTtkbLgHaFj?w=253&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            ),
            NewsTypes(
              name: "HEALTH",
              icon: Icons.monitor_heart_outlined,
              color: Colors.blue,
              title: "Seasonal Flu Spreads in Nearby Village",
              sub:
                  "12 cases reported in nearby areas. Drink boiled water and wear masks in gatherings. Next health camp: July 29 at PHC.",
              img:
                  "https://www.bing.com/th/id/OIP.1MW0RjTu6TAJ6IeeEwYJuQHaE8?w=198&h=128&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            ),
            NewsTypes(
              name: "PANCHAYAT",
              icon: Icons.people_alt_outlined,
              color: const Color.fromARGB(255, 243, 155, 60),
              title: "Panchayat Meeting on Water Issues",
              sub:
                  "Meeting today at 5 PM in Village School Hall. Topics: borewell repair, drainage cleaning. All villagers invited.",
              img:
                  "https://www.bing.com/th/id/OIP.HVBAQFf5tv650Vo-ujOtUAHaEK?w=211&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            ),
          ],
        ),
      ),
    );
  }
}
