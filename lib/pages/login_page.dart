import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mail = TextEditingController();
  final password = TextEditingController();

  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mail.text,
        password: password.text,
      );
    } catch (e) {
      if (e.toString().contains(
          "The supplied auth credential is incorrect, malformed or has expired.")) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Şifrenizi yanlış girdiniz! Lütfen tekrar deneyin.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SFPro",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      } else {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'Bilgilerinizi eksik veya yanlış girdiniz! Lütfen tekrar deneyin.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SFPro",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    mail.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Görüşmeyeli uzun zaman oldu.\nTekrar hoşgeldin!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SFPro",
                  fontSize: 20,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SFPro",
                      ),
                      autocorrect: false,
                      controller: mail,
                      decoration: const InputDecoration(
                        hintText: 'E-posta',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPro"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "SFPro",
                      ),
                      autocorrect: false,
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'Şifre',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "SFPro"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: const Text(
                        textAlign: TextAlign.start,
                        'Şifremi Unuttum',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SFPro",
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: login,
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "SFPro",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
