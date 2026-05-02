import 'package:demo/screens/agri/screens/fertilizer_recommendation_screen.dart';
import 'package:demo/screens/agri/screens/message.dart';
import 'package:demo/screens/agri/screens/nearby_fertilizer_shop_screen.dart';
import 'package:flutter/material.dart';

class FertilizerGuideScreen extends StatefulWidget {
  const FertilizerGuideScreen({super.key});

  @override
  State<FertilizerGuideScreen> createState() => _FertilizerGuideState();
}

class _FertilizerGuideState extends State<FertilizerGuideScreen> {
  List<Map<String, dynamic>> fertilizerIcons = [
    {
      "icon": Icons.science_outlined,
      "title": "Crop-Wise Recommendations",
      "subtitle": "Fertilizer recommendations for specific crops",
    },
    {
      "icon": Icons.calculate_outlined,
      "title": "Soil Fertility & Calculator",
      "subtitle": "Calculate fertilizer needs based on soil fertility",
    },
     {
      "icon": Icons.store_mall_directory,
      "title": "Nearby Fertilizer",
      "subtitle": "Find fertilizer shops near your location",
    },
    {
      "icon": Icons.event_note_sharp,
      "title": "Do's & Dont's",
      "subtitle": "Guidelines for proper fertilizer usage",
    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Fertilizer Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: fertilizerIcons.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FertilizerRecomendation(),
                            ),
                          );
                          
                        } 
                        else if(index==2){
                           NearbyFertilizerShopsHelper.openNearbyFertilizerShops();

                        }
                        else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Message()),
                          );
                        }
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Icon(
                              fertilizerIcons[index]['icon'],
                              size: 60,
                              color: Colors.green.shade700,
                            ),
                            title: Text(
                              fertilizerIcons[index]['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              fertilizerIcons[index]['subtitle'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
