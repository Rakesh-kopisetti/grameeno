
import 'package:demo/screens/bottomnav/bottomNavv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 50, 32),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text('O  T  P',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Color.fromARGB(255, 241, 225, 199),
              fontSize: 40,
              fontWeight: FontWeight.w900
            )
          ),),
            Padding(
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 249, 188, 33),
                  width: 0.2,
                ),
              ),
              child: TextField(
                // style: TextStyle(Color.fromARGB(a, r, g, b)),
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: Color.fromARGB(255, 249, 188, 33),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 249, 188, 33),
                    ),
                  ),
                  hintText: ("Enter OTP"),
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 239, 71, 37),
      
              minimumSize: Size(90, 40),
            ),
      
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleNav()),
              );
            },
            child: Text(
              "Submit",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 241, 225, 199),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}