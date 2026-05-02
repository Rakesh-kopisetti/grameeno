import 'package:demo/screens/bottomnav/navbar_visibility_provider.dart';
import 'package:demo/screens/services/Health/HealthScore/score.dart';
import 'package:demo/screens/services/Health/disease_warn.dart';
import 'package:demo/screens/services/Health/emergency_serv.dart';
import 'package:demo/screens/services/Health/reports.dart';
import 'package:demo/screens/services/Health/ai_clone.dart';
import 'package:demo/screens/services/Health/schemes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo/screens/services/Health/nearHospitals.dart';
import 'package:provider/provider.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final List<Map<String, dynamic>> tiles = [
    {
      "name": 'Health Alerts',
      "icon": 'assets/images/notify.png',
      'color': Colors.pink.shade50,
      'onTap': null,
    },
    {
      "name": 'Symptom Checker',
      "icon": 'assets/images/symptom.png',
      'color': Color.fromARGB(255, 155, 237, 241),
      'onTap': null,
    },
    {
      "name": 'Health Score',
      "icon": 'assets/images/healthscore.png',
      'color': Color.fromARGB(255, 205, 255, 164),
      'onTap': null,
    },
    {
      "name": 'Nearby Hospitals',
      "icon": 'assets/images/clinic.png',
      'color': Color.fromARGB(255, 231, 241, 184),
      'onTap': () => {}, // we'll assign the real function in the widget build
    },
  ];

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
            Colors.blue.shade400,
            Colors.blue.shade100,
            const Color.fromARGB(255, 247, 250, 199),
            //Colors.yellow.shade200
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 32,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            SizedBox(width: 20),
          ],
          // automaticallyImplyLeading: false,
          title: Text(
            '',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          ' Health Tips',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                          side: BorderSide(
                            color: Color.fromARGB(255, 239, 71, 37),
                          ),

                          minimumSize: Size(70, 30),
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Health()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hygiene",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 182, 7, 91),
                              ),
                            ),
                          ),
                        ),
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                          side: BorderSide(
                            color: Color.fromARGB(255, 25, 137, 34),
                          ),

                          minimumSize: Size(70, 30),
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Health()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Nutrition",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 123, 77),
                              ),
                            ),
                          ),
                        ),
                      ),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                          side: BorderSide(
                            color: Color.fromARGB(255, 239, 250, 87),
                          ),

                          minimumSize: Size(70, 30),
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Health()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Exercise",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 244, 255, 122),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/doc1.png',
                    height: 240,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    // color: Colors.white
                  ),
                  child: GridView.builder(
                    itemCount: 4,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 110,
                    ),
                    itemBuilder: (context, index) {
                      final Map tile = tiles[index];
                      return InkWell(
                        onTap: () {
                          if (tile["name"] == "Nearby Hospitals") {
                            NearbyHospitalsHelper.openNearbyHospitals();
                          }
                          if (tile["name"] == "Health Score") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Score()),
                            );
                          }
                          if (tile["name"] == "Symptom Checker") {
                            Provider.of<NavbarVisibilityProvider>(context, listen: false).hideNavBar();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AiChatScreen()),
                            ).then((_) => Provider.of<NavbarVisibilityProvider>(context, listen: false).showNavBar());
                          }
                        },

                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: tile['color'],
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  tile["icon"],
                                  height:
                                      tile["icon"] ==
                                                  "assets/images/symptom.png" ||
                                              tile["icon"] ==
                                                  "assets/images/healthscore.png"
                                          ? 50
                                          : 40,
                                  width:
                                      tile["icon"] ==
                                                  "assets/images/healthscore.png" ||
                                              tile["icon"] ==
                                                  "assets/images/symptom.png"
                                          ? 50
                                          : 40,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  tile["name"],
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/announce.png',
                        scale: 10,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '      Disease Outbreak Warnings',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseaseWarn(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 16,
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/scheme.png',
                        scale: 10,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '      Health Schemes & Benifits   ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Schemes()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 16,
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/emergency.png',
                        scale: 10,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '      Emergency Services             ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmergencyServ(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 16,
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/feedback.png',
                        scale: 10,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '      Feedback & Reports              ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Reports()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 16,
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
