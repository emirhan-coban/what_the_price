import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:what_the_price/util/places.dart';

class PlacesTile extends StatelessWidget {
  final Places places;
  const PlacesTile({super.key, required this.places});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            places.imagePath,
            fit: BoxFit.cover,
            width: 300,
            height: 200,
          ),
          Divider(
            color: Colors.grey[900]!,
            thickness: 1,
            height: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      places.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.grey[900],
                        fontFamily: "SFPro",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kategori: ${places.category}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontFamily: "SFPro",
                      ),
                    ),
                    Text("Fiyat Aralığı: ${places.price}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontFamily: "SFPro",
                        )),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _launchUrl(places.url);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: const Size(120, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Fiyatları Gör",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SFPro",
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
