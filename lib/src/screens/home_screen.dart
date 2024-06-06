import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:stationery_shop/src/screens/user_profile_screen.dart';

import '../services/api_service.dart';
import '../widgets/application_bar.dart';
import '../widgets/nav_drawer.dart';

const _kPages = <String, IconData>{
  'Home': Icons.home_rounded,
  'Map': Icons.map_rounded,
  'Add': Icons.add_rounded,
  'Notifications': Icons.notifications_rounded,
  'Profile': Icons.person_rounded,
};

class HomeScreen extends StatefulWidget {
  final ApiService apiService;

  const HomeScreen({super.key, required this.apiService});

  @override
  _HomeScreenState createState() => _HomeScreenState(apiService: apiService);
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService;
  int _selectedIndex = 0;

  _HomeScreenState({required this.apiService});

  final TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        key: const ValueKey('dashboard'),
        appBar: const ApplicationBar(title: 'Dashboard'),
        drawer: const NavDrawer(),
        body: _getBody(),
        bottomNavigationBar: ConvexAppBar.badge(
          const <int, dynamic>{},
          backgroundColor: const Color(0xFF19B0E7),
          color: Colors.white,
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        // TODO: Add home screen body
        return Center(
          child: Image.asset('lib/src/assets/images/home.png'),
        );
      case 1:
        // TODO: Add map screen body
        return const Center(child: Icon(Icons.map_rounded, size: 64));
      case 2:
        // TODO: Add add screen body
        return Center(
          child: Image.asset('lib/src/assets/images/home.png'),
        );
      case 3:
        // TODO: Add notifications screen body
        return Center(
          child: Image.asset('lib/src/assets/images/notification.png'),
        );
      case 4:
        return UserProfileScreen(apiService: apiService);
      default:
        return Container();
    }
  }
}
