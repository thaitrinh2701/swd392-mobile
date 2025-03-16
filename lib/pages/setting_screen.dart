import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swd392_mobile/components/sign_out_google.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notificationsEnabled = false;
  bool lightMode = false;
  bool darkMode = false;

  GoogleSignInAccount? user;
  String? token;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    user = googleSignIn.currentUser ?? await googleSignIn.signInSilently();

    if (user != null) {
      GoogleSignInAuthentication auth = await user!.authentication;
      setState(() {
        token = auth.idToken;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle("Account"),
          _buildProfileTile(), // Hiển thị thông tin người dùng
          _buildSwitchTile(
            icon: Icons.notifications,
            title: "Notifications",
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() => notificationsEnabled = value);
            },
          ),
          SizedBox(height: 20),
          _buildSectionTitle("Appearance"),
          _buildSwitchTile(
            icon: Icons.nights_stay,
            title: "Dark Mode",
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
                lightMode = !value;
              });
            },
          ),
          SizedBox(height: 20),
          _buildSectionTitle("Support"),
          _buildListTile(icon: Icons.help_outline, title: "Help Center"),
          _buildListTile(
            icon: Icons.logout,
            title: "Log Out",
            titleColor: Colors.red,
            onTap: () async {
              bool confirm = await _showLogoutDialog(context);
              if (confirm) {
                await SignOutGoogleButton().signOutGoogle(context);
              }
            },
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              "Rookies Comic v1.0.0\n© 2025 Rookies Comic. All rights reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile() {
    return FutureBuilder<String>(
      future: _getIdToken(), // Lấy ID Token
      builder: (context, snapshot) {
        return user == null
            ? Center(child: CircularProgressIndicator()) // Đang load
            : ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoUrl ?? ""),
                radius: 25,
              ),
              title: Text(
                user!.displayName ?? "No Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // Lấy Token test , đừng đụng :v
              // subtitle: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(user!.email, style: TextStyle(color: Colors.grey[600])),
              //     if (snapshot.hasData) // Hiển thị token
              //       SelectableText(
              //         "Token: ${snapshot.data}",
              //         style: TextStyle(fontSize: 12, color: Colors.blue),
              //       ),
              //   ],
              // ),
            );
      },
    );
  }

  Future<bool> _showLogoutDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Confirm Logout"),
                content: Text("Are you sure you want to log out?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("Logout", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
        ) ??
        false;
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Color titleColor = Colors.black,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title, style: TextStyle(color: titleColor)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

Future<String> _getIdToken() async {
  final googleUser = await GoogleSignIn().signInSilently();
  if (googleUser != null) {
    final googleAuth = await googleUser.authentication;
    return googleAuth.idToken ?? "No Token";
  }
  return "No Token";
}
