import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finaltoken;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
  static String routeName = '/splash_screen';
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return (finaltoken == null
              ? const LoginScreen()
              : const HomeScreen());
        }));
      });
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedtoken = sharedPreferences.getString("token");
    setState(() {
      finaltoken = obtainedtoken;
    });
    print(finaltoken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/wardrobe.png',
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Acumen",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ],
          ),
        ));
  }
}
