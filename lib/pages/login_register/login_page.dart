import 'package:flutter/material.dart';
import 'package:patico/widgets/button.dart';
import 'package:patico/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  //final Function()? onTap;
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  //sign user in
  void signIn() async {
    //show loading circle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const SizedBox(height: 50),
                  //logo
                  const Icon(Icons.construction, size: 100),
                  const SizedBox(height: 50),

                  //welcome back message
                  const Text(
                    "F-149",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 50),

                  //email textfield
                  MyTextField(
                    controller: emailTextController,
                    hintText: "Email",
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordTextController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  //sign in buton

                  MyButton(onTap: signIn, text: "Giriş Yap"),
                  const SizedBox(height: 10),

                  //go to register page
                  GestureDetector(
                    //onTap: widget.onTap,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Üye Değil Misin?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Şimdi Üye Ol 🐾",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                      ],
                    ),
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
