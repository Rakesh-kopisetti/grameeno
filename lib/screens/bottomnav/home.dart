import 'package:demo/screens/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:demo/screens/services/agriculture.dart';
import 'package:demo/screens/bottomnav/community.dart';
import 'package:demo/screens/bottomnav/more.dart';
import 'package:demo/screens/bottomnav/updates.dart';
import 'package:demo/screens/services/events.dart';
import 'package:demo/screens/services/health.dart';
import 'package:demo/screens/services/market.dart';
import 'package:demo/screens/services/moreservices.dart';
// <-- Import your dynamic weather card

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 2;
  final List pages = [HomeScreen(), Updates(), Community(), More()];

  void navigation(index) {
    setState(() {
      _selectedindex = index;
      return pages[_selectedindex] = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Good Morning, Kiran",
            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
            ),
            SizedBox(width: 18),
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 22),
          ],
        ),
        body: ListView(
          children: [
            // ✅ Weather Card integrated here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 400,
                child: WeatherCard(),
              ),
            ),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "     Services",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),

            // ✅ Service Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 350,
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _gridTile("Agriculture", "assets/images/agri.png", Agriculture()),
                    _gridTile("Events", "assets/images/events.png", Events()),
                    _gridTile("Market", "assets/images/market.png", Market()),
                    _gridTile("More", "assets/images/more.png", Moreservices(), countY: 2.4),
                    _gridTile("Health", "assets/images/health.png", Health()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  StaggeredGridTile _gridTile(String title, String image, Widget screen, {double countY = 1.2}) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: countY,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: customBox(title, image),
      ),
    );
  }

  Widget customBox(String title, String img) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 0),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
