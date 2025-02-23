import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swd392_mobile/api/Firebase_api.dart';
import 'package:swd392_mobile/pages/login_page.dart';

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
      title: 'Rookies Comic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(), // Đặt trang đầu tiên là LoginPage
    );
  }
}
