import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swd392_mobile/components/alternative_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildLoginForm(context), // Truyền context vào đây
        ],
      ),
    );
  }

  // Ảnh nền
  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ), // Chỉnh độ mờ của background
        child: Image.network(
          'https://cdn.donmai.us/original/1f/99/__usami_renko_and_maribel_hearn_touhou_drawn_by_yuhezi__1f991ff8142e60a21cc5ec3c773214ed.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB((0.9 * 255).toInt(), 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            const SizedBox(height: 10),
            _buildTitle(),
            const SizedBox(height: 20),
            _buildTextField(emailController, "Email"),
            const SizedBox(height: 12),
            _buildTextField(passwordController, "Password", isPassword: true),
            const SizedBox(height: 12),
            _buildLoginButton(),
            const SizedBox(height: 15),
            AlternativeLogin(), // Gọi component login Google
          ],
        ),
      ),
    );
  }

  // Logo
  Widget _buildLogo() {
    return Container(
      width: 250,
      height: 100,
      child: Image.asset("assets/images/logo_2.png", fit: BoxFit.contain),
    );
  }

  // Tiêu đề
  Widget _buildTitle() {
    return const Text(
      "WELCOME BACK, ROOKIE !!",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        // color: Color(0xFF4D4FC1),
        color: Colors.black,
      ),
    );
  }

  // Ô nhập liệu
  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xFF4D4FC1),
          ), // Màu viền khi chưa focus
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xFF4D4FC1),
            width: 2,
          ), // Màu viền khi focus
        ),
      ),
    );
  }

  // Nút đăng nhập
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4D4FC1),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          _login();
        },
        child: const Text(
          "Sign in",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget _buildAlternativeLogin() {
  //   return Column(
  //     children: [
  //       // Dòng kẻ ngang và chữ "OR"
  //       Row(
  //         children: [
  //           Expanded(
  //             child: Divider(
  //               color: Colors.black,
  //               thickness: 1,
  //               indent: 20,
  //               endIndent: 10,
  //             ),
  //           ),
  //           Text(
  //             "OR",
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           Expanded(
  //             child: Divider(
  //               color: Colors.black,
  //               thickness: 1,
  //               indent: 10,
  //               endIndent: 20,
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 10), // Khoảng cách
  //       // Nút đăng nhập với Google
  //       ElevatedButton.icon(
  //         onPressed: () {
  //           // TODO: Thêm logic đăng nhập Google ở đây
  //         },
  //         icon: Image.asset(
  //           'assets/images/google_icon.png', // Đường dẫn đến icon Google
  //           width: 24,
  //           height: 24,
  //         ),
  //         label: Text(
  //           "Log in with Google",
  //           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  //         ),
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.white, // Màu nền trắng giống Instagram
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8), // Viền bo góc
  //             side: BorderSide(color: Color(0xFF4D4FC1)), // Viền xám nhẹ
  //           ),
  //           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void _login() {}
}
