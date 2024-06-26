import 'package:flutter/material.dart';
import 'package:stationery_shop/src/services/api_service.dart';
import 'login_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key, required this.apiService});

  final ApiService apiService;

  @override
  _UserProfileScreenState createState() =>
      _UserProfileScreenState(apiService: apiService);
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ApiService apiService;

  _UserProfileScreenState({required this.apiService});

  Future<ApiResponse> _logoutUser() async {
    ApiResponse apiResponse = await widget.apiService.logoutUser();

    return apiResponse;
  }

  _onLogoutSuccess(BuildContext context) {
    _logoutUser().then((apiResponse) {
      if (apiResponse.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(apiService: widget.apiService),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(apiResponse.message),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage('lib/src/assets/images/avatar.png'),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        // TODO: Implement change profile picture functionality
                      },
                      mini: true,
                      backgroundColor: const Color(0xFF7D7D7D),
                      tooltip: 'Change Image',
                      child: Icon(
                        Icons.edit_rounded,
                        color: const Color(0xFF19B0E7).withOpacity(0.5),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              // TODO: Replace with user's full name
              'Prarup Gurung',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.apply(fontWeightDelta: 2),
            ),
            TextButton(
              child: Text(
                'View Full Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.apply(color: const Color(0xFF19B0E7), fontWeightDelta: 2),
              ),
              onPressed: () {
                // TODO: Implement view full profile functionality
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => {
                // TODO: Implement edit profile functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF19B0E7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Edit Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: Colors.white, fontWeightDelta: 1),
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.settings_rounded, color: Color(0xFF19B0E7)),
              title: Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: Colors.black, fontWeightDelta: 1),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFF7D7D7D)),
              onTap: () => {
                //   TODO: Implement settings functionality
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Color(0xFF19B0E7),
              ),
              title: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: Colors.black, fontWeightDelta: 1),
              ),
              onTap: () => _onLogoutSuccess(context),
            ),
          ],
        ),
      ),
    );
  }
}
