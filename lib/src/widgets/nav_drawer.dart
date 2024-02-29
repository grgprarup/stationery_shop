import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(
              'Stationery Shop', 'Prarup Gurung', 'developer001.sd@gmail.com'),
          _buildDrawerListTile(
              'Settings', Icons.settings_rounded, null, _onSettings),
          _buildDrawerListTile(
              'Contact Us', Icons.phone_in_talk_rounded, null, _onContactUs),
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

  void _onContactUs() {
    //   TODO: Implement contact us functionality
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
