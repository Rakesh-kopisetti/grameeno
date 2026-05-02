
import 'package:demo/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()),); });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Opacity(
          opacity: 1,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
        
              image: DecorationImage(image: AssetImage('assets/images/nature.gif',),fit: BoxFit.cover)
              // image: DecorationImage(image: AssetImage('assets/images/vil.gif',),fit: BoxFit.cover)
            ),
            child: Stack(
              children: [
                Text('Village Development                                                                                                            ')
              ],
            ),),
        ),
        
         Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  "Grama Sahayam",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
     
  }
}