import 'package:demo/screens/services/Health/HealthScore/fit.dart';
import 'package:demo/screens/services/Health/HealthScore/tasks.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key});

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
            Colors.blue.shade100,
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
          title: Text(
            "Health Score",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 50,
                        child: Image.asset(
                          'assets/Walking.gif',
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                          height: 400,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DAILY GOAL",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "87",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 80,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "%",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Fit(
                              icon: Icons.local_fire_department,
                              count: 1893,
                              name: "calories",
                              color: Colors.orange,
                            ),
                            SizedBox(height: 16),
                            Fit(
                              icon: Icons.directions_walk_outlined,
                              count: 8969,
                              name: "steps",
                              color: Colors.purple,
                            ),
                            SizedBox(height: 16),
                            Fit(
                              icon: Icons.nights_stay,
                              count: 7.5,
                              name: "hours",
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //   Text("Mindfulness & Meditation",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
                //   Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         spacing: 16,
                //         children: [
                //           Icon(Icons.music_note,size: 70,color: Colors.pinkAccent,),
                //           RichText(text: TextSpan(
                //             children: [
                //               TextSpan(
                //                   text: "Guided sessions\n",
                //                 style: TextStyle(
                //                   fontSize: 24,
                //                   fontWeight: FontWeight.w600
                //                 )
                //               ),
                //               TextSpan(
                //                   text: "for sleep, stress, focus",
                //                 style: TextStyle(
                //                   fontSize: 20,
                //                 )
                //               ),
                //             ]
                //           ))
                //         ],
                //       ),
                //     ),
                //   ),
                //   Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         spacing: 16,
                //         children: [
                //           Icon(Icons.timer_sharp,size: 65,color: Colors.deepPurple,),
                //           RichText(text: TextSpan(
                //               children: [
                //                 TextSpan(
                //                     text: "Timer\n",
                //                     style: TextStyle(
                //                         fontSize: 24,
                //                         fontWeight: FontWeight.w600
                //                     )
                //                 ),
                //                 TextSpan(
                //                     text: "relaxing sounds",
                //                     style: TextStyle(
                //                       fontSize: 20,
                //                     )
                //                 ),
                //               ]
                //           ))
                //         ],
                //       ),
                //     ),
                //   ),
                //   Card(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //         spacing: 16,
                //         children: [
                //           Icon(Icons.lightbulb_sharp,size: 65,color: Colors.yellow.shade600,),
                //           RichText(text: TextSpan(
                //               children: [
                //                 TextSpan(
                //                     text: "Daily Tips\n",
                //                     style: TextStyle(
                //                         fontSize: 24,
                //                         fontWeight: FontWeight.w600
                //                     )
                //                 ),
                //                 TextSpan(
                //                     text: "menatal wellness",
                //                     style: TextStyle(
                //                       fontSize: 20,
                //                     )
                //                 ),
                //               ]
                //           ))
                //         ],
                //       ),
                //     ),
                //   ),
                Text(
                  "Daily Tasks",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                Tasks(
                  color: Colors.lightBlue,
                  icon: Icons.water_drop,
                  title: "Drink 3 Litres of Water ",
                  sub: "Keeps you hydrated and energized.",
                ),
                Tasks(
                  color: Colors.orange,
                  icon: Icons.directions_walk_outlined,
                  title: " Walk 8,000 Steps",
                  sub: "Boost energy with light movement.",
                ),
                Tasks(
                  color: Colors.teal,
                  icon: Icons.self_improvement,
                  title: "Meditate (10 min)",
                  sub: "Calm your mind and reduce stress.",
                ),
                Tasks(
                  color: Colors.red,
                  icon: Icons.apple_rounded,
                  title: "Eat Fruits (2 servings)",
                  sub: "Fuel your body.",
                ),
                Tasks(
                  color: Colors.black38,
                  icon: Icons.bedtime,
                  title: "Sleep (7+ hours)",
                  sub: "Recharge fully for tomorrow.",
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
