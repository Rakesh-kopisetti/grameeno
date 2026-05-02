

import 'package:demo/screens/bottomnav/bottomnav.dart';
import 'package:demo/screens/bottomnav/home.dart';
import 'package:demo/screens/login.dart';
import 'package:demo/screens/weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:demo/screens/splash.dart';

void main(){
  //runApp(DevicePreview(builder: (context) => MyApp(),));
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bottomnav(),
      debugShowCheckedModeBanner: false,
    );
  }
}       



class PestControlScreen extends StatelessWidget {
  const PestControlScreen({super.key});

  final List<Map<String, dynamic>> features = const [
    {'title': 'Pest Identification', 'screen': PestIdentificationScreen()},
    {'title': 'Treatment Suggestions', 'screen': TreatmentSuggestionsScreen()},
    {'title': 'Crop-wise Pest Info', 'screen': CropInfoScreen()},
    {'title': 'Infestation Assessment', 'screen': InfestationAssessmentScreen()},
    {'title': 'Pest Forecast Alerts', 'screen': ForecastAlertsScreen()},
    {'title': 'Pest Gallery', 'screen': PestGalleryScreen()},
    {'title': 'Expert Helpline', 'screen': ExpertHelplineScreen()},
    {'title': 'Nearby Services', 'screen': NearbyServicesScreen()},
    {'title': 'Pesticide Tracker', 'screen': PesticideTrackerScreen()},
    {'title': 'Tutorials & Guides', 'screen': TutorialsGuidesScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Control'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: features.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => features[index]['screen']),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                features[index]['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Feature Screens Below

class PestIdentificationScreen extends StatelessWidget {
  const PestIdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Pest Identification',
      children: const [
        ListTile(title: Text('Upload Pest Image')),
        ListTile(title: Text('AI-based Recognition (Coming Soon)')),
        ListTile(title: Text('Manual Pest Selection')),
        ListTile(title: Text('Pest Info: Crops Affected, Lifecycle')),
      ],
    );
  }
}

class TreatmentSuggestionsScreen extends StatelessWidget {
  const TreatmentSuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Treatment Suggestions',
      children: const [
        ListTile(title: Text('Organic Treatments List')),
        ListTile(title: Text('Chemical Pesticide Usage')),
        ListTile(title: Text('Safety Instructions')),
      ],
    );
  }
}

class CropInfoScreen extends StatelessWidget {
  const CropInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Crop-wise Pest Info',
      children: const [
        ListTile(title: Text('Select Crop')), 
        ListTile(title: Text('See Common Pests')), 
        ListTile(title: Text('Seasonal Pest Updates')), 
      ],
    );
  }
}

class InfestationAssessmentScreen extends StatelessWidget {
  const InfestationAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Infestation Assessment',
      children: const [
        ListTile(title: Text('Symptom Questionnaire')),
        ListTile(title: Text('Infestation Severity Result')),
        ListTile(title: Text('Suggested Actions')),
      ],
    );
  }
}

class ForecastAlertsScreen extends StatelessWidget {
  const ForecastAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Pest Forecast Alerts',
      children: const [
        ListTile(title: Text('Location-based Predictions')),
        ListTile(title: Text('Crop & Season Risk')),
        ListTile(title: Text('Enable Notifications')),
      ],
    );
  }
}

class PestGalleryScreen extends StatelessWidget {
  const PestGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Pest Gallery',
      children: const [
        ListTile(title: Text('Browse by Type')),
        ListTile(title: Text('Filter by Crop')),
        ListTile(title: Text('Search Bar')),
      ],
    );
  }
}

class ExpertHelplineScreen extends StatelessWidget {
  const ExpertHelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Expert Helpline',
      children: const [
        ListTile(title: Text('Chat with Expert')),
        ListTile(title: Text('Call Support')),
        ListTile(title: Text('Support Timing')),
      ],
    );
  }
}

class NearbyServicesScreen extends StatelessWidget {
  const NearbyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Nearby Services',
      children: const [
        ListTile(title: Text('List Agro Shops')),
        ListTile(title: Text('Show on Map')),
        ListTile(title: Text('Call or Navigate')),
      ],
    );
  }
}

class PesticideTrackerScreen extends StatelessWidget {
  const PesticideTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Pesticide Tracker',
      children: const [
        ListTile(title: Text('Log Pesticide Usage')),
        ListTile(title: Text('Spray History')),
        ListTile(title: Text('Reminders & Alerts')),
      ],
    );
  }
}

class TutorialsGuidesScreen extends StatelessWidget {
  const TutorialsGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return featureScaffold(
      title: 'Tutorials & Guides',
      children: const [
        ListTile(title: Text('Video Guides')),
        ListTile(title: Text('Text & Image Tutorials')),
        ListTile(title: Text('IPM Practices')),
      ],
    );
  }
}

// Helper Widget for Reuse
Widget featureScaffold({required String title, required List<Widget> children}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      backgroundColor: Colors.green.shade700,
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: children,
    ),
  );
}
