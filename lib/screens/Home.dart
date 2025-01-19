import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';  // Import Lottie package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _authenticated = false;

  // Dummy data: User ID mapped to blood group and age
  final Map<String, Map<String, String>> _userData = {
    'user1': {'bloodGroup': 'A+', 'age': '25'},
    'user2': {'bloodGroup': 'B-', 'age': '30'},
    'user3': {'bloodGroup': 'O+', 'age': '28'},
  };

  String? _bloodGroup;
  String? _age;

  Future<void> _authenticate() async {
    try {
      _authenticated = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(stickyAuth: true),
      );

      if (_authenticated) {
        setState(() {
          _bloodGroup = _userData['user1']!['bloodGroup'];
          _age = _userData['user1']!['age'];
        });
      }
    } catch (e) {
      setState(() {
        _authenticated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Group Detector',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Use a placeholder image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Super User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'superuser@gmail.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                // Navigate to Help Page
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {
                // Handle Share Action
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Navigate to About Page
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _authenticated
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Blood Group: $_bloodGroup', style: TextStyle(fontSize: 20)),
                  Text('Age: $_age', style: TextStyle(fontSize: 20)),
                ],
              )
            : GestureDetector(
                onLongPress: _authenticate,  // Trigger authentication on long press
                child: Lottie.asset(
                  'assets/finger.json',  // Path to your Lottie animation file
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
