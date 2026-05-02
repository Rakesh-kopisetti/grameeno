import 'package:flutter/material.dart';

class DiseaseWarn extends StatelessWidget {
  DiseaseWarn({super.key});

  List<Map<String, dynamic>> diseaseAlerts = [
    {
      "disease": "Dengue Fever",
      "riskLevel": "High Risk",
      "riskColor": const Color.fromARGB(255, 238, 30, 15),
      "district": "Kakinada, Andhrapradesh",
      "issuedDate": "26 July 2025",
      "precaution": "Use mosquito repellents, wear full-sleeves",
      "icon": Icons.warning_amber,
    },
    {
      "disease": "Malaria",
      "riskLevel": "Moderate Risk",
      "riskColor": const Color.fromARGB(255, 253, 170, 45),
      "district": "Kakinada, Andhrapradesh",
      "issuedDate": "20 July 2025",
      "precaution": "Sleep under an insecticide-treated net",
      "icon": Icons.bug_report,
    },
    {
      "disease": "COVID-19",
      "riskLevel": "Moderate Risk",
      "riskColor": const Color.fromARGB(255, 253, 170, 45),
      "district": "Kakinada, Andhrapradesh",
      "issuedDate": "15 July 2025",
      "precaution": "Wear a mask, maintain distance",
      "icon": Icons.coronavirus,
    },
    {
      "disease": "Chikungunya",
      "riskLevel": "Moderate Risk",
      "riskColor": const Color.fromARGB(255, 253, 170, 45),
      "district": "Kakinada, Andhrapradesh",
      "issuedDate": "18 July 2025",
      "precaution": "Avoid stagnant water, wear protective clothing",
      "icon": Icons.warning_amber,
    },
    {
      "disease": "Swine Flu",
      "riskLevel": "High Risk",
      "riskColor": const Color.fromARGB(255, 250, 29, 13),
      "district": "Nagpur, Maharashtra",
      "issuedDate": "22 July 2025",
      "precaution": "Get vaccinated, avoid crowded places",
      "icon": Icons.sick,
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

          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade200,
            const Color.fromARGB(255, 241, 245, 180),
            //Colors.yellow.shade200
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Disease Alerts",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 2, 33, 86),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...diseaseAlerts.map((disease) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  disease['icon'],
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    disease['disease'],

                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 2, 33, 86),
                                    ),
                                  ),
                                  Text(
                                    disease['riskLevel'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: disease['riskColor'],
                                    ),
                                  ),
                                  Text(
                                    disease['district'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    disease['issuedDate'],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    disease['precaution'],
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
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
