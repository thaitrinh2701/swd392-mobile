import 'package:flutter/material.dart';
import 'home_page.dart';

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
      body: Stack(children: [_buildBackgroundImage(), _buildLoginForm()]),
    );
  }

  // Ảnh nền
  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.network(
        'https://cdn.donmai.us/original/0d/98/__usami_renko_and_maribel_hearn_touhou_and_1_more_drawn_by_meiyamada10__0d98b8790b11f039310e3845119d0781.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  // Form đăng nhập
  Widget _buildLoginForm() {
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
            _buildAlternativeLogin(),
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
        color: Color(0xFF4D4FC1),
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
        hintStyle: TextStyle(color: Color(0xFF4D4FC1)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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

  Widget _buildAlternativeLogin() {
    return TextButton(
      onPressed: () {
        // Thêm logic đăng nhập với Google
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/google_icon.png", width: 20, height: 20),
          const SizedBox(width: 8),
          const Text(
            "Try Another Way",
            style: TextStyle(fontSize: 16, color: Color(0xFF4D4FC1)),
          ),
        ],
      ),
    );
  }

  void _login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
