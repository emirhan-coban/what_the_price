// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:what_the_price/util/drawer.dart';
import 'package:what_the_price/util/places.dart';
import 'package:what_the_price/util/places_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Places> placesMenu = [
    Places(
      name: "Espressolab",
      price: "Orta",
      imagePath: "assets/images/espressolab.jpg",
      category: "Kahve, Çay, Tatlı",
      url: "https://www.espressolab.com/menu/"
    ),
    Places(
      name: "Kahve Dünyası",
      price: "Ucuz-Orta",
      imagePath: "assets/images/kahve_dunyasi.jpg",
      category: "Kahve, Çay, Tatlı",
      url: "https://www.kahvedunyasi.com/menu"
    ),
  ];

  List<Places> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = placesMenu;
  }

  void _filterPlaces(String query) {
    final results = placesMenu.where((place) {
      final placeName = place.name.toLowerCase();
      final input = query.toLowerCase();
      return placeName.contains(input);
    }).toList();

    setState(() {
      filteredPlaces = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[900],
          size: 30,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              // Handle settings onTap
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Optional: Add some space at the top
            Text(
              "Aradığınız her\nrestoran ve kafenin\nfiyatlarına erişin!",
              style: TextStyle(
                fontSize: 36,
                color: Colors.grey[900],
                fontFamily: "SFPro",
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                style: TextStyle(
                  color: Colors.grey[900],
                  fontFamily: "SFPro",
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: "Ara...",
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: "SFPro",
                    fontSize: 18,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
                onChanged: _filterPlaces,
              ),
            ),
            SizedBox(height: 15),
            Column(
              children: filteredPlaces.map((place) => PlacesTile(places: place)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
