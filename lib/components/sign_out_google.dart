import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swd392_mobile/pages/login_page.dart';

class SignOutGoogleButton extends StatelessWidget {
  const SignOutGoogleButton({Key? key}) : super(key: key);

  Future<void> signOutGoogle(BuildContext context) async {
    try {
      // Hiển thị loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Kiểm tra xem có người dùng đăng nhập không
      if (FirebaseAuth.instance.currentUser != null) {
        // Xóa dữ liệu đăng nhập từ SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();

        // Đăng xuất Google và Firebase
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
      }

      // Đóng loading
      Navigator.of(context).pop();

      // Chuyển về màn hình đăng nhập, xóa hết màn hình trước đó
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    } catch (e) {
      // Đóng loading nếu có lỗi
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lỗi khi đăng xuất: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOutGoogle(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text("Sign Out"),
    );
  }
}
