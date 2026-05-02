import 'package:demo/screens/agri/screens/cropAdvisory.dart';
import 'package:demo/screens/agri/screens/fertilizer_guide_screen.dart';
import 'package:demo/screens/agri/screens/pestcontrol_screen.dart';
import 'package:flutter/material.dart';

class AgricultureInfoScreen extends StatefulWidget {
  const AgricultureInfoScreen({super.key});

  @override
  State<AgricultureInfoScreen> createState() => _AgricultureInfoScreenState();
}

class _AgricultureInfoScreenState extends State<AgricultureInfoScreen> {
  @override
  List<Map<String, dynamic>> homeIcons = [
    {"text": "Crop Advisory", "icon": Icons.eco},
    {"text": "Fertilizer Guide", "icon": Icons.science_outlined},
    {"text": "Pest Control", "icon": Icons.bug_report_outlined},
    {"text": "Seasonal Guidance", "icon": Icons.calendar_today_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Agriculture Assistance"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: homeIcons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CropAdvisoryScreen(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FertilizerGuideScreen(),
                          ),
                        );
                      }
                      else if(index==2){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>PestControlScreen()));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade400.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              homeIcons[index]["icon"],
                              size: 60,
                              color: Colors.green.shade800,
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                homeIcons[index]["text"],
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
