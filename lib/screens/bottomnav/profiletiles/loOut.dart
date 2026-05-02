import 'package:flutter/material.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 150,
        width: 200,
        child: Column(
          children: [
            const Text("Logout")]
      ),)
    );
  }
}
