import 'package:demo/screens/bottomnav/community.dart';
import 'package:demo/screens/bottomnav/homepage.dart';
import 'package:demo/screens/bottomnav/profile.dart';
import 'package:demo/screens/bottomnav/updates/home/update_home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'navbar_visibility_provider.dart';

class GoogleNav extends StatefulWidget {
  const GoogleNav({super.key});

  @override
  State<GoogleNav> createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  final List pages = [HomePage(), UpdateHome(), Community(), Profile()];
  int active_index = 0;
  @override
  Widget build(BuildContext context) {
    final navbarVisibilityProvider = Provider.of<NavbarVisibilityProvider>(context);

    return Scaffold(
      bottomNavigationBar: navbarVisibilityProvider.isNavBarVisible
          ? Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 8, bottom: 16),
              child: GNav(
                padding: EdgeInsets.all(12),
                tabBackgroundColor: Colors.blue.shade200,
                color: Colors.blueGrey,
                backgroundColor: Colors.grey.shade100,
                gap: 8,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
                onTabChange: (val) {
                  setState(() {
                    active_index = val;
                  });
                },
                tabs: [
                  GButton(
                    icon: active_index == 0 ? Icons.home : Icons.home_outlined,
                    text: 'Home',
                    iconActiveColor: Colors.black,
                  ),
                  GButton(
                    icon: active_index == 1
                        ? Icons.newspaper
                        : Icons.newspaper_outlined,
                    text: 'Updates',
                    iconActiveColor: Colors.black,
                  ),
                  GButton(
                    icon: active_index == 2
                        ? Icons.group
                        : Icons.group_outlined,
                    text: 'Community',
                    iconActiveColor: Colors.black,
                  ),
                  GButton(
                    icon: active_index == 3
                        ? Icons.person
                        : Icons.person_outlined,
                    text: 'Profile',
                    iconActiveColor: Colors.black,
                  )
                ],
              ),
            )
          : null,
      body: Center(child: pages[active_index]),
    );
  }
}
