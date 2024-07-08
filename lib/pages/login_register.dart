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
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 200,
          title: Image.asset(
            "assets/images/price.png",
            height: 150,
            width: 150,
          ),
          elevation: 0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                child: const TabBar(
                  dividerColor: Colors.white,
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
