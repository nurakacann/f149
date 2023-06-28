import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patico/widgets/button.dart';
import 'package:patico/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**Shared Preferences verilerinizi basit yapılar 
üzerinde telefonda lokal olarak saklamanızı sağlayan bir pakettir.*/

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = '';
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool isLoading = false;

//TODO: Login ekranında Mytextfild da son kullanıcının mailini kaydetme başlangıç.
  // SharedPreferences instance
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  // Initialize SharedPreferences instance
  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    if (savedEmail != null) {
      setState(() {
        emailTextController.text = savedEmail;
      });
    }
  }

  // Save email to SharedPreferences
  void saveEmailToSharedPreferences(String email) async {
    await prefs.setString('email', email);
  }
//TODO: Login ekranında Mytextfild da son kullanıcının mailini kaydetme bitiş.

//! FİREBASE KONTROLÜ İLE GİRİLEN KİŞİYİ KONTROL EDİP HATA MESAJLARI YAZDIRMA BAŞLANGIÇ.
  //sign user in
  void signIn() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      // Save email to SharedPreferences
      saveEmailToSharedPreferences(emailTextController
          .text); //MAİL ADRESİNİ EMAİL CONTROLLERA KAYDET KAYDET.
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = 'Giriş yaparken bir hata oluştu: ${e.message}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
//! FİREBASE KONTROLÜ İLE GİRİLEN KİŞİYİ KONTROL EDİP HATA MESAJLARI YAZDIRMA BİTİŞ.

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
                //const Text("F149"),
                const SizedBox(height: 25),

                //email textfield
                Column(
                  children: [
                    //email textfield
                    MyTextField(
                      controller: emailTextController,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),

                    //password textfield
                    MyTextField(
                      controller: passwordTextController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),

//TODO: GİRİŞ KISMINDA HATA VARSA  EKRANDA TEXT HATA MESAJINI GÖSTER BAŞLANGIÇ.
                    //error message
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
//TODO: GİRİŞ KISMINDA HATA VARSA  EKRANDA TEXT HATA MESAJINI GÖSTER BİTİŞ.

//! GİRİŞ KISMINDA HATA YOKSA LOADİNG ÇUBUĞUNU GÖSTER VE GİRİŞ YAP.
                    //sign in button
                    if (isLoading)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.orange.shade400,
                        ),
                      )
                    else
                      const SizedBox(height: 15),

                    SizedBox(
                      height: 50,
                      child: MyButton(
                        onTap: signIn,
                        text: 'GİRİŞ YAP',
                        textColor: Colors.white,
                        buttonColor: Colors.orange.shade400,
                        borderColor: Colors.white,
                      ),
                    ),
//! GİRİŞ KISMINDA HATA YOKSA LOADİNG ÇUBUĞUNU GÖSTER VE GİRİŞ YAP BİTİŞ.
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
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
