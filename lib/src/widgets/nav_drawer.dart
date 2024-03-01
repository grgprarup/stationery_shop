import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(
              'Stationery Shop', 'Prarup Gurung', 'grgprarup@gmail.com'),
          _buildDrawerListTile(
              'Settings', Icons.settings_rounded, null, _onSettings),
          ExpansionTile(
            title: const Text('Developer Contacts'),
            leading: const Icon(Icons.contact_support_rounded),
            initiallyExpanded: isExpanded,
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            children: [
              if (isExpanded)
                Column(
                  children: [
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          _makePhoneCall('+977-9841156043');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.phone_rounded),
                            SizedBox(width: 8),
                            Text(
                              '+977-9841156043',
                                style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          _sendEmail('developer001.sd@gmail.com');
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.email_rounded),
                            SizedBox(width: 8),
                            Text('developer001.sd@gmail.com',
                            style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          _buildDrawerListTile(
              'FAQ', Icons.question_mark_rounded, null, _onFAQ),
          _buildDrawerListTile('Logout', Icons.logout_rounded, null, _onLogout),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(String title, String name, String email) {
    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(email),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.white,
        // TODO: Add user profile picture
        child: FlutterLogo(size: 42.0),
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF19B0E7),
      ),
    );
  }

  Widget _buildDrawerListTile(String title, IconData leadingIcon,
      [IconData? trailingIcon, Function()? onTap]) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title),
      trailing: Icon(trailingIcon),
      onTap: onTap,
    );
  }

  _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await _launchURL(launchUri);
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await _launchURL(launchUri);
  }

  void _onSettings() {
    //   TODO: Implement settings functionality
  }

  void _onFAQ() {
    // TODO: Implement FAQ functionality
  }

  void _onLogout() {
    // TODO: Implement logout functionality
  }
}
