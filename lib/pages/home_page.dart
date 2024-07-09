import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:what_the_price/util/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Anasayfa',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "SFPro",
          ),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hoşgeldin!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 20,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.pushNamed(context, '/login');
                }
              },
              child: const Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
