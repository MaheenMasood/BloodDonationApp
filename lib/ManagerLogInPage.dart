import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_text_field.dart';
import 'package:my_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

import 'ManagerScreen.dart';

class ManagerLogInPage extends StatefulWidget {
  final void Function()? onTap;
  const ManagerLogInPage({super.key, required this.onTap});

  @override
  State<ManagerLogInPage> createState() => _ManagerLogInPageState();
}

class _ManagerLogInPageState extends State<ManagerLogInPage> {
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign-in
  void signIn() async {
    // Get the auth service
    final authServices = Provider.of<AuthServices>(context, listen: false);

    try {
      await authServices.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    
      // Navigate to the ManagerScreen on successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ManagerScreen(), // Replace with the actual ManagerScreen widget
        ),
      );


    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.asset(
                  'lib/assets/Red_Drop.png', // Provide the path to your image
                  width: 150,
                  height: 150,
                  //color: Colors.grey[800],
                ),

                const SizedBox(height: 15),

                // Welcome back message
                const Text(
                  "Zindagi",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Log In As Manager
                const Text(
                  "LogIn As Manager",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // Sign-in button
                MyButton(onTap: signIn, text: "Sign In"),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
