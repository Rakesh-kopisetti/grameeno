import 'package:demo/screens/agri/screens/fertilizer_fulldetails_screen.dart';
import 'package:flutter/material.dart';
import '../data/fertilizer_data.dart';

class FertilizerRecomendation extends StatefulWidget {
  const FertilizerRecomendation({super.key});

  @override
  State<FertilizerRecomendation> createState() =>
      _FertilizerRecomendationState();
}

class _FertilizerRecomendationState extends State<FertilizerRecomendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade700),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: fertilizerDetails.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => FertilizerFullDetails(
                            details: fertilizerDetails[index],
                          ),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              fertilizerDetails[index]['image'],
                              height: 125,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ), // spacing between image and text
                        Expanded(
                          child: Text(
                            fertilizerDetails[index]['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
