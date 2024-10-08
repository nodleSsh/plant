import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant/components/logo.dart';
import 'package:plant/components/my_textfield.dart';
import 'package:plant/components/social_button.dart';
import 'package:plant/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isChecked = false;

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      displayMessageToUser("Passwords don't match!", context);
    }
   else{
     try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/home_page');
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      displayMessageToUser(e.code, context);
    }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyLogo(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create new account',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF004643),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextfield(
                hintText: 'Enter your email address',
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextfield(
                hintText: 'Enter your password',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextfield(
                hintText: 'Enter your confirm password',
                obscureText: true,
                controller: confirmPasswordController,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    shape: const CircleBorder(),
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: "I’ve read and agreed to ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        children: const [
                          TextSpan(
                            text: "User Agreement ",
                            style: TextStyle(
                              color: Color(0xFF004643),
                            ),
                          ),
                          TextSpan(text: 'and '),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Color(0xFF004643),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: registerUser,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF004643),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'other way to sign in',
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(pathImage: 'lib/images/google.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SocialButton(pathImage: 'lib/images/facebook.png'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back to Sign In',
                      style: TextStyle(
                          color: Color(0xFF004643),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
