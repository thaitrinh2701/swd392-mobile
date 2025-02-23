import 'package:flutter/material.dart';
import 'package:swd392_mobile/components/signOutGoogle.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String token;

  const HomePage({Key? key, required this.email, required this.token})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserInfo(email: email, token: token), //
            const SizedBox(height: 20),
            SignOutGoogleButton(),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String email;
  final String token;

  const UserInfo({Key? key, required this.email, required this.token})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome, $email!",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "Token:",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        SelectableText(token, textAlign: TextAlign.center),
      ],
    );
  }
}
