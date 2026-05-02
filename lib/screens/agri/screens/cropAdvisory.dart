import 'package:demo/screens/agri/screens/crop_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/agri/data/crop_data.dart';
import '../data/crop_data.dart';

class CropAdvisoryScreen extends StatefulWidget {
  const CropAdvisoryScreen({super.key});

  @override
  State<CropAdvisoryScreen> createState() => _CropAdvisoryScreenState();
}

class _CropAdvisoryScreenState extends State<CropAdvisoryScreen> {
  List<String> season = ["Kharif", "Rabi", "Zaid"];
  List<String> soil = [
    "Black Soil",
    "Alluvial Soil",
    "Red Soil",
    "Sand Soil",
    "Loamy Soil",
  ];
  String? selectedSeason;
  String? selectedSoil;

  List<Map<String, dynamic>> getFilteredCrops() {
    if (selectedSeason == null && selectedSoil == null) {
      return cropDetails; // show all initially
    } else if (selectedSeason != null && selectedSoil != null) {
      return cropDetails
          .where(
            (crop) =>
                crop['season'] == selectedSeason &&
                crop['soil'] == selectedSoil,
          )
          .toList();
    } else {
      return []; // no crop shown until both selected
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCrops = getFilteredCrops();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          "Crop Advisory",
          style: TextStyle(
            fontSize: 20,
           
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for season title
              Text(
                "Enter the Season:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              //for season drop down
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  value: selectedSeason,
                  hint: Text("  Select Season"),
                  onChanged: (String? val) {
                    setState(() {
                      selectedSeason = val!;
                    });
                  },
                  items:
                      season.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: 10),

              //for soil title
              Text(
                "Select the soil:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              //for soil drop down
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  value: selectedSoil,
                  hint: Text("  Select Soil"),
                  onChanged: (String? val) {
                    setState(() {
                      selectedSoil = val!;
                    });
                  },
                  items:
                      soil.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Recommended Crops",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),

              filteredCrops.isEmpty
                  ? Center(
                    child: Text(
                      "No matched crops",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  )
                  : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredCrops.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      final crop = filteredCrops[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      CropDetailScreen(cropFullDetails: crop),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade400.withOpacity(0.3),
                                blurRadius: 6,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image (Upper half)
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  crop['image'],
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Details (Lower half)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      crop['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade800,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "Season: ${crop['season']}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Soil: ${crop['soil']}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
