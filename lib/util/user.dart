import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:what_the_price/pages/home_page.dart';
import 'package:what_the_price/pages/login_register.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginRegister();
        }
      },
    ));
  }
}
