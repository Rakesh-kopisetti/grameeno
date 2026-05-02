import 'package:flutter/material.dart';
import 'package:demo/screens/agri/data/crop_data.dart';
import 'package:demo/screens/agri/data/fertilizer_data.dart';

class FertilizerFullDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  const FertilizerFullDetails({super.key, required this.details});

  @override
  State<FertilizerFullDetails> createState() => _FertilizerFullDetailsState();
}

class _FertilizerFullDetailsState extends State<FertilizerFullDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade700),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green.shade50,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            widget.details['image'],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 15),

                        Text(
                          widget.details['name'],
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.details['fertilizerused'],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.details['apply'],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.details['quantity'],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
