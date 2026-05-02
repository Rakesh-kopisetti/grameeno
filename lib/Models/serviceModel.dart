import 'package:demo/alerts/alerts_screen.dart';
import 'package:demo/screens/agri/screens/agriculture_info.dart';
import 'package:demo/screens/services/events.dart';
import 'package:demo/screens/services/Health/health.dart';
import 'package:demo/events_ui/event.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String subtitle;
  final String image;
  final Widget? destination;
  final bool isTall;
  final IconData icon;

  ServiceModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.destination,
    this.isTall = false,
    required this.icon,
  });
}

final List<ServiceModel> services = [
  ServiceModel(
    title: 'HEALTH SERVICES',
    subtitle: 'Motor, Health & more',
    image: 'assets/Assets/doctor.png',
    isTall: true,
    destination: Health(),
    icon: Icons.health_and_safety_outlined,
  ),
  ServiceModel(
    title: 'AGRICULTURAL',
    subtitle: 'Personal, Gold and More',
    image: 'https://cdn-icons-png.freepik.com/512/3227/3227831.png',
    destination: AgricultureInfoScreen(),
    icon: Icons.agriculture_outlined,
  ),
  ServiceModel(
    title: 'EVENTS',
    subtitle: 'Save Daily, Gold SIP',
    image: 'https://cdn-icons-png.freepik.com/512/9281/9281826.png',
    destination: HomeScreenPage(),
    isTall: true,
    icon: Icons.event_available_outlined,
  ),
  ServiceModel(
    title: 'ALERTS',
    subtitle: 'Save Daily, Gold SIP',
    image: 'https://cdn-icons-png.freepik.com/512/9281/9281826.png',
    destination: AlertsScreen(),
    icon: Icons.notifications_active_outlined,
  ),
];
