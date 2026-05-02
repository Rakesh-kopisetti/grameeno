import 'package:demo/claculator/home_page.dart';
import 'package:demo/screens/services/Health/health.dart';
import 'package:demo/screens/weather/weather.dart';
import 'package:demo/widgets/containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:core';

import 'package:demo/screens/services/agriculture.dart';
import 'package:demo/screens/services/events.dart';
import 'package:demo/Models/serviceModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeindex = 0;
  final user = FirebaseAuth.instance.currentUser;
  final List<String> imageUrls = [
    'assets/Assets/slider1.png',
    'assets/Assets/slider2.png',
    'assets/Assets/slider3.png',
    'assets/Assets/slider4.png',
    'assets/Assets/slider5.png',
  ];

  final List<dynamic> fun = [Health(), Agriculture(), Events()];
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "GOOD MORNING,";
    } else if (hour < 17) {
      return "GOOD AFTERNOON,";
    } else {
      return "GOOD EVENING,";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cat = [
      {'icon': Icons.calculate_outlined, 'label': 'Intrest'},
      {'icon': Icons.menu_book_outlined, 'label': 'Contrect'},
      {'icon': Icons.lightbulb_outline, 'label': 'Simple Intrest'},
      {'icon': Icons.currency_rupee_outlined, 'label': 'Loan EMI'},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 246, 244),
        // extendBodyBehindAppBar: true,
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(
            context,
          ).copyWith(overscroll: false, scrollbars: false),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          getGreeting(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 11, 11, 12),
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 1.3,
                            letterSpacing: 0.8,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 340,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: WeatherCard(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  top: 14,
                  left: 15,
                  right: 14,
                  bottom: 5,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'SERVICES',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 9, 9, 9),
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childCount: services.length,
                  itemBuilder: (context, index) {
                    return ServiceContainer(service: services[index]);
                  },
                ),
              ),

              // SliverPadding(
              //   padding: EdgeInsets.all(12),
              //   sliver: SliverToBoxAdapter(
              //     child: Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CarouselSlider.builder(
              //             itemCount: imageUrls.length,
              //             itemBuilder: (context, index, realindex) {
              //               final img = imageUrls[index];
              //               return Container(
              //                 width: double.infinity,
              //                 margin: EdgeInsets.symmetric(horizontal: 5),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(12),
              //                   image: DecorationImage(
              //                     image: NetworkImage(img),
              //                     fit: BoxFit.cover,
              //                   ),
              //                   border: Border.all(
              //                     width: 1,
              //                     color: Colors.grey.shade400,
              //                   ),
              //                 ),
              //               );
              //             },
              //             options: CarouselOptions(
              //               enlargeCenterPage: true,
              //               aspectRatio: 4,
              //               pauseAutoPlayOnTouch: true,
              //               scrollPhysics: PageScrollPhysics(),
              //               viewportFraction: 1,
              //               onPageChanged: (index, reason) {
              //                 setState(() {
              //                   activeindex = index;
              //                 });
              //               },
              //             ),
              //           ),
              //           SizedBox(height: 5),
              //           buildindicator(),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SliverPadding(
              //   padding: const EdgeInsets.all(14),
              //   sliver: SliverMasonryGrid.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 12,
              //     crossAxisSpacing: 12,
              //     childCount: categories2.length,
              //     itemBuilder: (context, index) {
              //       final items = categories2[index];
              //       final bool tall = items['isTall'] == true;
              //       return Container(
              //         height: tall ? 212 : 100,
              //         decoration: BoxDecoration(
              //           color: const Color.fromARGB(255, 220, 227, 230),
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         child: Stack(
              //           children: [
              //             Container(
              //               width: double.infinity,
              //               height: double.infinity,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(12),
              //                 border: Border.all(
              //                   width: 1,
              //                   color: Colors.grey.shade400,
              //                 ),
              //               ),
              //             ),
              //             Positioned(
              //               right: 5,
              //               bottom: 5,
              //               child: Image(
              //                 image: NetworkImage(items['image']),
              //                 height: 60,
              //               ),
              //             ),

              //             Padding(
              //               padding: const EdgeInsets.all(12.0),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     items['title'],
              //                     style: const TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                   Text(
              //                     items['subtitle'],
              //                     style: const TextStyle(
              //                       fontSize: 13,
              //                       color: Colors.grey,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              SliverPadding(
                padding: EdgeInsets.all(12),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black, spreadRadius: 1),
                        ],
                        color: const Color.fromARGB(255, 220, 227, 230),
                        //Color.fromARGB(255, 184, 223, 239),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FINANCIAL TOOLS',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text(
                            //   'Subtitle and Attributes and others',
                            //   style: const TextStyle(
                            //     fontSize: 13,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.all(12),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://media.istockphoto.com/id/1346611118/vector/scene-with-business-people-working-in-the-office.webp?s=2048x2048&w=is&k=20&c=Ffyw1PUE7DbuiwVdd8iLMMbE0uc3SAlN_A0LSQaF-Vw=',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 220, 227, 230),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Intrest Calculator',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              'More ->',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                              cat.map((item) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Icon(item['icon'] as IconData),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      item['label']! as String,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 30)),
              SliverPadding(
                padding: EdgeInsets.all(12),
                sliver: SliverToBoxAdapter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildindicator() => AnimatedSmoothIndicator(
    activeIndex: activeindex,
    effect: ExpandingDotsEffect(
      dotWidth: 10,
      activeDotColor: Colors.blueGrey,
      dotHeight: 5,
    ),
    count: imageUrls.length,
  );
}
