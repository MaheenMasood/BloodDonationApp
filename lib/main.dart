import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/SplashScreen.dart';
import 'package:my_app/firebase_options.dart';
//import 'package:my_app/services/auth/auth_gate.dart';
//import 'package:my_app/LogInPage.dart';
//import 'package:my_app/services/auth/Login_or_Register.dart';
import 'package:my_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

//import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( ChangeNotifierProvider(
    create: (context) => AuthServices(),
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      );
  }
}
