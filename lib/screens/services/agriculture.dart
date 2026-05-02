

import 'package:flutter/material.dart';

class Agriculture extends StatefulWidget {
  const Agriculture({super.key});

  @override
  State<Agriculture> createState() => _AgricultureState();
}

class _AgricultureState extends State<Agriculture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("AGRICULTURE"),
      ),
    );
  }
}