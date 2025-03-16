import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swd392_mobile/api/Firebase_api.dart';
import 'package:swd392_mobile/pages/splash_screen.dart'; // Import SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rookies Comic',
      theme: ThemeData(
        fontFamily: "NerkoOne",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
