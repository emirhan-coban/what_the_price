// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final mail = TextEditingController();

  Future forgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: mail.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text(
              'Şifre sıfırlama e-postası gönderildi.',
              style: TextStyle(
                fontSize: 18,
                fontFamily: "SFPro",
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      if (e.toString().contains("channel-error")) {
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
                'Lütfen geçerli bir e-posta adresi girin.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SFPro",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      } else if (e.toString().contains("invalid-email")) {
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
                'Lütfen geçerli bir e-posta adresi girin.',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Şifremi Unuttum',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "SFPro",
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Olamaz! Şifreni mi unuttun?",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "SFPro",
                  color: Colors.red[400],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                "Hiç merak etme, aşağıya e-posta adresini yaz ve sana şifreni sıfırlaman için bir e-posta gönderelim.",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "SFPro",
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: forgotPassword,
              child: const Text(
                'Gönder',
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
