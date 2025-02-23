import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ảnh nền
          Positioned.fill(
            child: Image.network(
              'https://cdn.donmai.us/original/0d/98/__usami_renko_and_maribel_hearn_touhou_and_1_more_drawn_by_meiyamada10__0d98b8790b11f039310e3845119d0781.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    width: 250, // Kích thước container giữ ảnh
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo_2.png",
                      fit:
                          BoxFit
                              .contain, // Đảm bảo ảnh giữ nguyên tỉ lệ trong giới hạn kích thước
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Tiêu đề
                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4D4FC1),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nhập email
                  _buildTextField(emailController, "Username or email"),
                  const SizedBox(height: 12),

                  // Nhập mật khẩu
                  _buildTextField(
                    passwordController,
                    "Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  // Nút đăng nhập
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4D4FC1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _login();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 18, // Kích thước chữ lớn hơn
                          fontWeight: FontWeight.bold, // Chữ đậm hơn
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      // Thêm logic đăng nhập với Google tại đây
                    },
                    child: Row(
                      mainAxisSize:
                          MainAxisSize
                              .min, // Để nội dung không chiếm hết chiều ngang
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Căn giữa logo và text
                      children: [
                        Image.asset(
                          "assets/images/google_icon.png",
                          width: 20, // Kích thước logo
                          height: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ), // Khoảng cách giữa logo và chữ
                        const Text(
                          "Try Another Way",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Colors
                                    .purple, // Đổi màu chữ để giống với UI của bạn
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;
    print("Login với email: $email, mật khẩu: $password");
  }
}
