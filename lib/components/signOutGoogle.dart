import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swd392_mobile/pages/login_page.dart';

class SignOutGoogleButton extends StatelessWidget {
  const SignOutGoogleButton({Key? key}) : super(key: key);

  Future<void> _signOutGoogle(BuildContext context) async {
    try {
      await GoogleSignIn().signOut(); // Đăng xuất Google
      await FirebaseAuth.instance.signOut(); // Đăng xuất Firebase

      // Chuyển hướng về LoginPage
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Lỗi khi đăng xuất: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _signOutGoogle(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Màu nền
        foregroundColor: Colors.white, // Màu chữ
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Sign Out"),
    );
  }
}
