import 'package:demo/screens/bottomnav/navbar_visibility_provider.dart';
import 'package:demo/events_ui/committee_member_data.dart';
import 'package:demo/events_ui/contribution_data.dart';
import 'package:demo/events_ui/donor_data.dart';
import 'package:demo/events_ui/expenditure_data.dart';
import 'package:demo/logins/login_mediator.dart';
import 'package:demo/screens/bottomnav/homepage.dart';
import 'package:demo/screens/services/Health/schemes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCsKrLih-1oXlyPv9asDKoTW_wI4I6eXz0",
        authDomain: "fir-46e95.firebaseapp.com",
        projectId: "fir-46e95",
        storageBucket: "fir-46e95.firebasestorage.app",
        messagingSenderId: "445664570447",
        appId: "1:445664570447:web:04c32d78b844726a400e3a",
        measurementId: "G-KQJGTKQPMP",
      ),
    );
    runApp(DevicePreview(builder: (context) => MyApp()));
  } else {
    await Firebase.initializeApp();
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContributionData()),
        ChangeNotifierProvider(create: (context) => ExpenditureData()),
        ChangeNotifierProvider(create: (context) => DonorData()),
        ChangeNotifierProvider(create: (context) => CommitteeMemberData()),
        ChangeNotifierProvider(create: (context) => NavbarVisibilityProvider()),
      ],
      child: MaterialApp(
        home: MainPage(),
        //Schemes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
