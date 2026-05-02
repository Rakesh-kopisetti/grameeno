import 'package:demo/screens/agri/data/pest_data.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/agri/screens/pestcontrol_screen.dart';
import '../data/pest_data.dart';
class PestFullDetailsScreen extends StatefulWidget {
 final Map<String,dynamic> pestFullDetails;
  const PestFullDetailsScreen({
    super.key,
    required this.pestFullDetails,
    });

  @override
  State<PestFullDetailsScreen> createState() => _PestFullDetailsScreenState();
}

class _PestFullDetailsScreenState extends State<PestFullDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("PestFullDetailsScreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
               ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(widget.pestFullDetails['image'],width: double.infinity,fit: BoxFit.cover),
                
               ),
               SizedBox(height: 15),
               Text(widget.pestFullDetails['name']),
               SizedBox(height: 15),
               Text(widget.pestFullDetails['details'],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}