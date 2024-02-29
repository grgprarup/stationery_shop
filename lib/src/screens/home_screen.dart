import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../widgets/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  final ApiService apiService;

  const HomeScreen({super.key, required this.apiService});

  @override
  _HomeScreenState createState() => _HomeScreenState(apiService: apiService);
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService;

  _HomeScreenState({required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF19B0E7),
        title: const Text("Dashboard"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO: Add dashboard implementation
            Text(
              'Successfully Logged in',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: const NavDrawer(),
    );
  }
}
