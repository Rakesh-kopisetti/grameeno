import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _UpdatesState();
}

class _UpdatesState extends State<More> {
  final List<Map<String, dynamic>> Newstiles = [
    {
      "name": "Andhra Pradesh Scheme",
      'img': "assets/images/agri.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Pesticide Prices",
      'img': "assets/images/pesti.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Fertilizer Prices ",
      'img': "assets/images/fertilizer.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Organic Farming",
      'img': "assets/images/organic.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Domestic Animals",
      'img': "assets/images/cows.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Rise in temparature",
      'img': "assets/images/suntemp.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
    {
      "name": "Anna Daatha ",
      'img': "assets/images/farmer.png",
      "para":
          "Recent agriculture news includes the approval of the PM Dhan-Dhaanya Krishi Yojana for 100 districts, focusing on rural development and agricultural growth",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 750,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final Map Newstile = Newstiles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height: 110,
                            width: 400,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color.fromARGB(255, 251, 255, 147),
                                  
                                  Colors.white,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.5),
                            ),

                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 110,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 0.2),
                                        image: DecorationImage(
                                          image: AssetImage(Newstile['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          Newstile['name'],
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 15,
                                              color: const Color.fromARGB(
                                                255,
                                                0,
                                                0,
                                                0,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('Recent agriculture news includes \nRecent agriculture news includes \nthe approval of the PM')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 10),
                      itemCount: 7,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}