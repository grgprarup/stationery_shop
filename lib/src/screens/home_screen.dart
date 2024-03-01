import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../widgets/application_bar.dart';
import '../widgets/nav_drawer.dart';

const _kPages = <String, IconData>{
  'home': Icons.home,
  'map': Icons.map,
  'add': Icons.add,
  'message': Icons.message,
  'person': Icons.person,
};

class HomeScreen extends StatefulWidget {
  final ApiService apiService;

  const HomeScreen({super.key, required this.apiService});

  @override
  _HomeScreenState createState() => _HomeScreenState(apiService: apiService);
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService;

  _HomeScreenState({required this.apiService});

  final TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: const ApplicationBar(title: 'Dashboard'),
        drawer: const NavDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    for (final icon in _kPages.values) Icon(icon, size: 64),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          const <int, dynamic>{3: '99+'},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}
