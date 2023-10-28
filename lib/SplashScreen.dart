import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/LogInPage.dart';

//import 'services/auth/auth_gate.dart';
//import 'package:my_app/Home_Page.dart';
//import 'package:my_app/LogInPage.dart';

//import 'services/auth/auth_gate.dart';
//import 'package:mini_hackathon/screens/login.dart';

//import 'LogInPage.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // After the delay, navigate to the AuthGate (or any other screen you prefer).
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogInPage(onTap: () {  },)));
    });
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/assets/drop.png'),
            ),
            const SizedBox(height: 16), // Add some spacing between the image and text
            Text(
              'Zindagi',
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust the font weight as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}