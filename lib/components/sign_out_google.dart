import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swd392_mobile/pages/login_page.dart';

Future<void> SignOutGoogleButton(BuildContext context) async {
  try {
    // Hiển thị loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Xóa toàn bộ dữ liệu đăng nhập từ SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Xóa toàn bộ dữ liệu cũ

    // Kiểm tra nếu có người dùng đăng nhập, thì tiến hành đăng xuất
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut(); // Đăng xuất khỏi Firebase

      GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect(); // Xóa phiên Google
        await googleSignIn.signOut(); // Đăng xuất Google
      }
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
