

import 'package:demo/screens/bottomnav/community.dart';
import 'package:demo/screens/bottomnav/home.dart';
import 'package:demo/screens/bottomnav/more.dart';
import 'package:demo/screens/bottomnav/updates.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  var selectedindex=3;
  void navigation(int index){
    setState(() {
      selectedindex=index;
    });
  }
final List pages=[HomeScreen(),Updates(),Community(),More()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          
          backgroundColor: Colors.white,
           showUnselectedLabels: false,
           currentIndex: selectedindex,
           selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
           ),
        
           selectedItemColor: Colors.blue,
           onTap: navigation,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Image.asset('assets/images/house.png',height: 25,), label: 'Home'),
            BottomNavigationBarItem(icon: Image.asset('assets/images/updates.png',height: 29,), label: 'Updates'),
            BottomNavigationBarItem(icon: Image.asset('assets/images/community.png',height: 30,), label: 'Community'),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined,size: 29,),label: 'More',),
          ],
        ),
      ),
      body: Center( 
          child: pages[selectedindex],
      ),
    );
  }
}