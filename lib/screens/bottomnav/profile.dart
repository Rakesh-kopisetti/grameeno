import 'package:demo/screens/bottomnav/profiletiles/about.dart';
import 'package:demo/screens/bottomnav/profiletiles/help.dart';
import 'package:demo/screens/bottomnav/profiletiles/notifications.dart';
import 'package:demo/screens/bottomnav/profiletiles/privacy.dart';
import 'package:demo/screens/bottomnav/profiletiles/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient background
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF09819), Color(0xFFFF512F)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      // image: const DecorationImage(
                      //   image: AssetImage('assets/categories/crossfit.png'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Pawan Kalyan",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "pawankalyan03@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Buttons with navigation
            buildMenuButton(context, Icons.notifications, "Notifications", destination: const NotificationsScreen()),
            buildMenuButton(context, Icons.settings, "Settings", destination: const SettingsScreen()),
            buildMenuButton(context, Icons.security_outlined, "Privacy", destination: const PrivacyScreen()),
            buildMenuButton(context, Icons.live_help, "Help", destination: const HelpScreen()),
            buildMenuButton(context, Icons.info_outlined, "About", iconColor: Colors.red, destination: const AboutScreen()),

            // Logout with confirmation
            buildMenuButton(
              context,
              Icons.logout,
              "Logout",
              iconColor: Colors.red,
              textColor: Colors.redAccent,
              customOnTap: () => showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(
    BuildContext context,
    IconData icon,
    String text, {
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
    Widget? destination,
    VoidCallback? customOnTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.withOpacity(0.2),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: customOnTap ??
            () {
              if (destination != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              }
            },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 30, color: iconColor),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged out successfully")),
              );
            },
            child: const Text("Logout" ,style: TextStyle(color: Colors.white),),  
          ),
        ],
      ),
    );
  }
}
