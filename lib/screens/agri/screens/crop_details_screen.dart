import 'package:flutter/material.dart';

class CropDetailScreen extends StatelessWidget {
  final Map<String, dynamic> cropFullDetails;

  const CropDetailScreen({super.key, required this.cropFullDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cropFullDetails['name']),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                cropFullDetails['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                cropFullDetails['name'],
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow("🌱 Season", cropFullDetails['season']),
                  buildInfoRow("🥥 Soil", cropFullDetails['soil']),
                  buildInfoRow("💧 Water", cropFullDetails['water']),
                  buildInfoRow("☀️ Climate", cropFullDetails['climate']),
                  buildInfoRow("🐛 Pests", cropFullDetails['pests']),
                  buildInfoRow(
                    "❤️ Fertilizers",
                    cropFullDetails['fertilizers'],
                  ),
                  buildInfoRow("💰 Price", cropFullDetails['price']),
                  buildInfoRow("📍 Region", cropFullDetails['region']),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              cropFullDetails['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Tips for Farmers",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...cropFullDetails['tips']
                .toString()
                .split(RegExp(r'\.\s*'))
                .where((tip) => tip.trim().isNotEmpty)
                .map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      "• ${tip.trim()}.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
