// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:what_the_price/firebase_options.dart';
import 'package:what_the_price/pages/home_page.dart';
import 'package:what_the_price/pages/login_register.dart';
import 'package:what_the_price/util/user.dart';

import 'pages/forgot_password.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserPage(),
      routes: {
        '/user':(context) => const UserPage(),
        '/login': (context) => const LoginRegister(),
        '/home': (context) => const HomePage(),
        '/forgot_password': (context) => const ForgotPassword(),
      },
    );
  }
}