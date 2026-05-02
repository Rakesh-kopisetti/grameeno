import 'package:demo/screens/agri/screens/pest_fulldetails_screen.dart';
import 'package:flutter/material.dart';
import '../data/pest_data.dart';

class PestDetailsScreen extends StatefulWidget {
  const PestDetailsScreen({super.key});

  @override
  State<PestDetailsScreen> createState() => _PestControlScreenState();
}

class _PestControlScreenState extends State<PestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Pest Control"),
      ),
      body: GridView.builder(
        itemCount: pestDetails.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PestFullDetailsScreen(
                          pestFullDetails: pestDetails[index],
                        ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        pestDetails[index]['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        pestDetails[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
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
    );
  }
}
