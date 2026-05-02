
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final List<Map<String, dynamic>> tiles = [
    {
      "name": 'Health Alerts',
      "icon": 'assets/images/notify.png',
      'color': Colors.pink.shade50,
    },
    {
      "name": 'Symptom Checker',
      "icon": 'assets/images/symptom.png',
      'color': const Color.fromARGB(255, 134, 242, 248),
    },
    {
      "name": 'Health Score',
      "icon": 'assets/images/healthscore.png',
      'color': const Color.fromARGB(255, 205, 255, 164),
    },
    {
      "name": 'Nearby Clinics',
      "icon": 'assets/images/clinic.png',
      'color': const Color.fromARGB(255, 0, 255, 195),
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

          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade100,
            const Color.fromARGB(255, 247, 250, 199),
            //Colors.yellow.shade200
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: const Color.fromARGB(255, 255, 255, 255),),),
            
            SizedBox(width: 30,)
          ],
          // automaticallyImplyLeading: false,
          title: Text(
            '',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        ' Health Tips',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                            side: BorderSide(
                              color: Color.fromARGB(255, 239, 71, 37),
                            ),
          
                            minimumSize: Size(70, 30),
                          ),
          
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Health()),
                            );
                          },
                          child: Text(
                            "Hygiene",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 182, 7, 91),
                              ),
                            ),
                          ),
                        ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                            side: BorderSide(
                              color: Color.fromARGB(255, 25, 137, 34),
                            ),
          
                            minimumSize: Size(70, 30),
                          ),
          
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Health()),
                            );
                          },
                          child: Text(
                            "Nutrition",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 20, 123, 77),
                              ),
                            ),
                          ),
                        ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                            side: BorderSide(
                              color: Color.fromARGB(255, 245, 255, 138),
                            ),
          
                            minimumSize: Size(70, 30),
                          ),
          
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Health()),
                            );
                          },
                          child: Text(
                            "Exercise",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 244, 255, 122),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 217, 47, 255),
                    minRadius: 25,
                    child: Image.asset('assets/images/doc.png', height: 200),
                  ),
                ],
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    // color: Colors.white
                  ),
                  child: GridView.builder(
                    itemCount: 4,
          
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 110,
                    ),
                    itemBuilder: (context, index) {
                      final Map tile = tiles[index];
                      return Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: tile['color'],
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                tile["icon"],
                                height: 70,
                                width: 50,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tile["name"],
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset('assets/images/announce.png', scale: 10),
                      Text(
                        '      Disease Outbreak Warnings',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset('assets/images/scheme.png', scale: 10),
                      Text(
                        '      Health Schemes & Benifits   ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset('assets/images/docconnect.png', scale: 10),
                      Text(
                        '      Connect to a Doctor             ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset('assets/images/emergency.png', scale: 10),
                      Text(
                        '      Emergency Services             ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset('assets/images/awareness.png', scale: 10),
                      Text(
                        '    Awareness Videos & Articles ',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      CircleAvatar(
                        radius: 13,
                        child: Icon(Icons.chevron_right))
                    ],
                  ),
                ),
              ),

              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset('assets/images/feedback.png', scale: 10),
                    Text(
                      '      Feedback & Reports              ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    CircleAvatar(
                      radius: 13,
                      child: Icon(Icons.chevron_right))
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
