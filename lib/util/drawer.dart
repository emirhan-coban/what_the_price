import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: Column(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "assets/images/price.png",
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              'Ana Sayfa',
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Ayarlar',
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle settings onTap
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'Çıkış Yap',
              style: TextStyle(
                fontFamily: "SFPro",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    titlePadding: const EdgeInsets.only(left: 20, top: 10),
                    content: const Text(
                      'Çıkış yapmak istediğinize emin misiniz?',
                      style: TextStyle(
                        fontFamily: "SFPro",
                        fontSize: 24,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 25, right: 25, top: 15, bottom: 10),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Hayır',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SFPro",
                            fontSize: 24,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text(
                          'Evet',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SFPro",
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
