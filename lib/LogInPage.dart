import 'package:flutter/material.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_text_field.dart';
import 'package:my_app/services/auth/auth_services.dart';
//import 'package:my_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

import 'Register_Page.dart';
import 'services/auth/auth_gate.dart';

class LogInPage extends StatefulWidget {
  final void Function()? onTap;
  const LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //signIn
  void signIn() async {
    // get the auth service
    final authServices = Provider.of<AuthServices>(context, listen: false);

    try {
      await authServices.signInWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );

      // Navigate to AuthGate on successful sign-in
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => AuthGate()));
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
          // Wrap the content with SingleChildScrollView
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

                  //welcome back message
                  const Text(
                    "Zindagi",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  //Log In
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),


                  //email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //signIn button
                  MyButton(onTap: signIn, text: "Sign In"),

                  const SizedBox(height: 50),

                  //user not a member? register now?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text('Not a member?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the registration page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(onTap: () {  },),
                            ),
                          );
                        },
                        child: const Text(
                          'Want To Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
