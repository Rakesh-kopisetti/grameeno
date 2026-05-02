import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
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
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Updates'),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.only(top: 8),
            dividerHeight: 0,
            indicatorAnimation: TabIndicatorAnimation.elastic,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            dragStartBehavior: DragStartBehavior.start,
            tabs: [
              Tab(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green),

                    foregroundColor: Colors.green,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/images/agrinews.png'
                      , height: 30),
                      Text(
                        '   Agriculture News',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 221, 3, 255),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/images/weather.png', height: 30),
                      Text(
                        '   Weather',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Tab(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 0, 47, 255),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/images/announce.png', height: 30),
                      Text(
                        '   Govt Announcements',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Tab(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/images/event1.png', height: 30),
                      Text(
                        '   Events',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Tab(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 0, 255, 247),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/images/job.png', height: 30),
                      Text(
                        '   Job Alerts',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
         // viewportFraction: 1,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 650,
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
                                  Colors.lightGreen.shade200,
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

            Center(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 650,
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
                                  const Color.fromARGB(255, 255, 150, 251),
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
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),),
            Center(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 650,
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
                                  const Color.fromARGB(255, 141, 190, 255),
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
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),),
            Center(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 650,
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
                                  const Color.fromARGB(255, 255, 135, 135),
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
                      itemCount: 3,
                    ),
                  ),
                ],
              ),
            ),),
            Center(child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    height: 650,
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
                                  const Color.fromARGB(255, 193, 255, 254),
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
                      itemCount: 1,
                    ),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
