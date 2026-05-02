import 'package:demo/screens/agri/screens/pest_details_screen.dart';
import 'package:demo/screens/agri/screens/pest_identification_screen.dart';
import 'package:flutter/material.dart';

class PestControlScreen extends StatefulWidget {
  const PestControlScreen({super.key});

  @override
  State<PestControlScreen> createState() => _PestControlScreenState();
}

class _PestControlScreenState extends State<PestControlScreen> {
  List<Map<String,dynamic>> typesOfPestIdentification=[
    {
      "icon": Icons.pest_control_rounded,
      "title": "pest Details",
      "subtitle":"It will navigate to pest details",
    },
    {
      "icon": Icons.search_outlined,
      "title": "Pest Identification",
      "subtitle":"It will navigate to pest Identifiactioon Screen",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Pest Control"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: typesOfPestIdentification.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        if(index==1){
                          Navigator.push(context,MaterialPageRoute(builder:(context)=> PestIdentificationScreen()));
                        }
                        else if(index==0){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>PestDetailsScreen()));
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
                              typesOfPestIdentification[index]['icon'],
                              size: 60,
                              color: Colors.green.shade700,
                            ),
                            title: Text(
                              typesOfPestIdentification[index]['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              typesOfPestIdentification[index]['subtitle'],
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