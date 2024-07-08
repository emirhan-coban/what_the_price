import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final mail = TextEditingController();
  final password = TextEditingController();
  final repeatpassword = TextEditingController();

  Future register() async {
    if (password.text == repeatpassword.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail.text,
          password: password.text,
        );
      } catch (e) {
        if (e.toString().contains("email-already-in-use")) {
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
                  'Bu e-posta adresi zaten kullanımda! Lütfen başka bir e-posta adresi deneyin.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SFPro",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else if (e.toString().contains("the-given-password-is-invalid")) {
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
                  'Şifreniz en az 6 karakter olmalıdır! Lütfen tekrar deneyin.',
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
                  'Bilgilerinizi yanlış veya eksik girdiniz! Lütfen tekrar deneyin.',
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
    } else {
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
              'Bilgilerinizi yanlış veya eksik girdiniz! Lütfen tekrar deneyin.',
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
                'Üye değil misin? Neyi bekliyorsun?\nHemen kayıt ol!',
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
                      controller: repeatpassword,
                      decoration: const InputDecoration(
                        hintText: 'Şifreni Onayla',
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
                onPressed: register,
                child: const Text(
                  'Kayıt Ol',
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
