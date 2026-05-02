import 'package:demo/Models/serviceModel.dart';
import 'package:flutter/material.dart';

class ServiceContainer extends StatelessWidget {
  final ServiceModel service;

  const ServiceContainer({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (service.destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => service.destination!),
          );
        }
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1)],
          color: Color.fromARGB(255, 222, 230, 223),
          //color: Color.fromARGB(255, 211, 240, 251),
          borderRadius: BorderRadius.circular(12),
          //border: Border.all(color: Colors.grey.shade600),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  service.icon,
                  size: 34,
                  color: //Color.fromARGB(255, 17, 59, 24),
                          Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                service.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              // Text(service.subtitle,
              //     style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
