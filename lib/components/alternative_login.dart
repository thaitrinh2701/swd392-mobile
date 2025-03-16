import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swd392_mobile/pages/home_page.dart';

Future<void> googleSignIn(BuildContext context) async {
  try {
    print("Google Sign-In started...");

    String serverClientID =
        '230013270044-v2h3l15c3suatsgic7nlurbhjb8ghp3t.apps.googleusercontent.com';

    GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: serverClientID,
      scopes: ['email', 'profile', 'openid'],
    );

    GoogleSignInAccount? user = await googleSignIn.signIn();

    if (user != null) {
      print("User signed in: ${user.email}");

      GoogleSignInAuthentication auth = await user.authentication;
      String email = user.email;
      String token = auth.idToken ?? "No Token";
      String displayName = user.displayName ?? "No Name";
      String photoUrl = user.photoUrl ?? "No Avatar";
      String userId = user.id;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('token', token);
      await prefs.setString('displayName', displayName);
      await prefs.setString('photoUrl', photoUrl);
      await prefs.setString('userId', userId);

      print("Google Sign-In successful!");

      // Chờ UI cập nhật trước khi chuyển trang
      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    } else {
      print("User canceled sign-in");
    }
  } catch (e) {
    print("Error signing in: $e");
  }
}
