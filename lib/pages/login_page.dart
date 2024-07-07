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

  void login() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail.text,
      password: password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/price.png',
              width: 200,
              height: 200,
            ),
            const Text(
              'What The Price',
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 32,
                color: Colors.black87,
              ),
            ),
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
                    autocorrect: false,
                    obscureText: true,
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
            const SizedBox(height: 15),
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
    );
  }
}
