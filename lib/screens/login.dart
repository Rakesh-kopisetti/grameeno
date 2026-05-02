
import 'package:demo/screens/bottomnav/bottomNavv.dart';
import 'package:demo/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 3, 50, 32),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 10),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Color.fromARGB(255, 239, 71, 37),
                    side: BorderSide(color: Color.fromARGB(255, 239, 71, 37)),

                    minimumSize: Size(90, 40),
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoogleNav()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 241, 225, 199),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //       AppBar(
          //   leading: Container(
          //     height: 20,
          //     width: 30,
          //     decoration: BoxDecoration(),
          //     child: Padding(
          //       padding: const EdgeInsets.all(2.0),
          //       child: Image.asset('lib/images/image.png'),
          //     ),
          //   ),
          //   backgroundColor: Colors.transparent,
          //   title: Text(
          //     'My Village',
          //     style: GoogleFonts.lato(
          //       textStyle: TextStyle(
          //         color: Color.fromARGB(255, 241, 225, 199),
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // );
          SizedBox(height: 2),

          Align(
            alignment: Alignment(-1.1, 1),
            child: Transform.rotate(
              angle: 1.72,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/dec1.png'),
              ),
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Colors.white.withOpacity(0.4),
                //     Colors.white.withOpacity(0.05),
                //   ],
                // ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 249, 188, 33),
                          minimumSize: Size(90, 40),
                        ),

                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 50, 32),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 3, 50, 32),
                          side: BorderSide(
                            color: Color.fromARGB(255, 249, 188, 33),
                          ),
                          minimumSize: Size(90, 40),
                        ),

                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 249, 188, 33),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

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
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 249, 188, 33),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 249, 188, 33),
                            ),
                          ),
                          hintText: ("Enter Name"),
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                    ),
                  ),

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
                            Icons.call,
                            color: Color.fromARGB(255, 249, 188, 33),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 249, 188, 33),
                            ),
                          ),
                          hintText: ("Enter Mobile Number"),
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
                        MaterialPageRoute(builder: (context) => OTP()),
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
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/dec.png'),
            ),
          ),
        ],
      ),
    );
  }
}
