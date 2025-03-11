// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:swd392_mobile/pages/home_page.dart';

// class AlternativeLogin extends StatelessWidget {
//   const AlternativeLogin({super.key});

//   Future<void> googleSignIn(BuildContext context) async {
//     try {
//       // Lấy serverClientID từ .env
//       // String serverClientID = dotenv.env['SERVER_CLIENT_ID'] ?? '';
//       String serverClientID =
//           '230013270044-v2h3l15c3suatsgic7nlurbhjb8ghp3t.apps.googleusercontent.com';

//       GoogleSignIn googleSignIn = GoogleSignIn(
//         serverClientId: serverClientID,
//         scopes: [
//           'email',
//           'profile',
//           'openid',
//         ], // Yêu cầu email, profile, OpenID
//       );
//       GoogleSignInAccount? user = await googleSignIn.signIn();

//       if (user != null) {
//         GoogleSignInAuthentication auth = await user.authentication;
//         String email = user.email;
//         String token = auth.idToken ?? "No Token";

//         print("User signed in: $email");
//         print("ID Token: $token");

//         // Chuyển sang HomePage và truyền dữ liệu
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomePage(email: email, token: token),
//           ),
//         );
//       } else {
//         print("User canceled sign-in");
//       }
//     } catch (e) {
//       print("Error signing in: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Divider(
//                 color: Colors.black,
//                 thickness: 1,
//                 indent: 20,
//                 endIndent: 10,
//               ),
//             ),
//             const Text(
//               "OR",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Expanded(
//               child: Divider(
//                 color: Colors.black,
//                 thickness: 1,
//                 indent: 10,
//                 endIndent: 20,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton.icon(
//           onPressed: () => googleSignIn(context),
//           icon: Image.asset(
//             'assets/images/google_icon.png',
//             width: 24,
//             height: 24,
//           ),
//           label: const Text(
//             "Log in with Google",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//               side: const BorderSide(color: Color(0xFF4D4FC1)),
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//           ),
//         ),
//       ],
//     );
//   }
// }
