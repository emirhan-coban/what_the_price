import 'package:flutter/material.dart';
import 'package:what_the_price/pages/login_page.dart';
import 'package:what_the_price/pages/register_page.dart';
import 'package:what_the_price/util/tab_item.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'What The Price',
            style: TextStyle(
              fontFamily: "SFPro",
              fontSize: 32,
              color: Colors.black87,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: const TabBar(
                  indicatorColor: Colors.red,
                  tabs: [
                    TabItem(
                      title: "Giriş Yap",
                    ),
                    TabItem(title: "Kayıt Ol"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            LoginPage(),
            RegisterPage(),
          ],
        ),
      ),
    );
  }
}
