import 'package:flutter/material.dart';
import 'package:patico/widgets/button.dart';
import 'package:patico/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                //logo
                Icon(
                  Icons.app_registration_rounded,
                  size: 100,
                  color: Colors.orange.shade400,
                ),

                //F149
                const Text("F149"),
                const SizedBox(height: 25),

                //email textfield
                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(height: 15),

                //password textfield
                MyTextField(
                  controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                //sign in button
                MyButton(
                  onTap: () {},
                  text: 'GİRİŞ YAP',
                  textColor: Colors.white,
                  buttonColor: Colors.orange.shade400,
                  borderColor: Colors.white,
                ),

                //go to register page
                const SizedBox(height: 15),

                MyButton(
                  onTap: widget.onTap,
                  text: 'KAYIT OL',
                  buttonColor: Colors.white,
                  borderColor: Colors.orange.shade400,
                  textColor: Colors.orange.shade400,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
