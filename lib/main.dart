import 'package:flutter/material.dart';
import 'package:peter_s_application1/presentation/log_in_screen/log_in_screen.dart';
import 'package:peter_s_application1/presentation/profile_screen/profile_screen.dart';
import 'package:peter_s_application1/presentation/register_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool rememberMe = prefs.getBool('rememberMe') ?? false;

  runApp(MyApp(rememberMe: rememberMe));
}


class MyApp extends StatelessWidget {
  final bool rememberMe;

  const MyApp({required this.rememberMe});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate loading or checking user authentication
    Future.delayed(Duration(seconds: 2), () {
      // Check if the user is already logged in or not
      bool isLoggedIn = checkUserLoggedIn(); // Replace this with your own logic

      // Navigate to the appropriate screen based on the user's login status
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  bool checkUserLoggedIn() {
    // Implement your logic to check if the user is already logged in or not
    // Return true if the user is logged in, false otherwise
    // You can use shared preferences, local storage, or any other method to store the user's login status
    // For demonstration purposes, let's assume the user is already logged in
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}