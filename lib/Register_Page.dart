import 'package:flutter/material.dart';
import 'package:my_app/services/auth/auth_services.dart';
import 'package:provider/provider.dart';
import 'LogInPage.dart';
import 'components/my_button.dart';
import 'components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();

  //sign up user
  void SignUp() async {
    if (passwordController.text != ConfirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match!"),
        ),
      );
      return;
    }
    final authServices = Provider.of<AuthServices>(context, listen: false);

    try {
      await authServices.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
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
                  const SizedBox(height: 45),

                  //Image
                  Image.asset(
                    'lib/assets/Red_Drop.png', // Provide the path to your image
                    width: 150,
                    height: 150,
                    //color: Colors.grey[800],
                  ),

                  const SizedBox(height: 9),

                  //create an account
                  const Text(
                    "Zindagi",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),


                  //create an account
                  const Text(
                    "Create An Account!",
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

                  const SizedBox(height: 10),

                  //configure password textfield
                  MyTextField(
                    controller: ConfirmpasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //sign Up button
                  MyButton(onTap: SignUp, text: "Sign Up"),

                  const SizedBox(height: 50),

                  //user not a member? register now?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the login page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LogInPage(onTap: () {  },),
                            ),
                          );
                        },
                        child: const Text(
                          'Login now',
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
