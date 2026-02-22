import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_the_price/pages/favorites_page.dart';
import 'package:what_the_price/pages/place_detail_page.dart';
import 'package:what_the_price/util/drawer.dart';
import 'package:what_the_price/util/favorites_manager.dart';
import 'package:what_the_price/util/places.dart';
import 'package:what_the_price/util/places_data.dart';
import 'package:what_the_price/util/places_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Places> filteredPlaces = [];
  String selectedCategory = "Hepsi";
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {"label": "Hepsi", "icon": Icons.apps_rounded},
    {"label": "Kahve", "icon": Icons.coffee_rounded},
    {"label": "Dünya Mutfağı", "icon": Icons.public_rounded},
    {"label": "Tatlı", "icon": Icons.cake_rounded},
    {"label": "Fast Food", "icon": Icons.fastfood_rounded},
    {"label": "Dondurma", "icon": Icons.icecream_rounded},
  ];

  @override
  void initState() {
    super.initState();
    filteredPlaces = PlacesData.allPlaces;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
      filteredPlaces = PlacesData.allPlaces.where((place) {
        final matchesQuery = place.name
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            place.category.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesCategory = selectedCategory == "Hepsi" ||
            place.category.contains(selectedCategory);
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  void _filterPlaces(String query) {
    searchQuery = query;
    _applyFilters();
  }

  void _filterByCategory(String category) {
    selectedCategory = category;
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87, size: 28),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Consumer<FavoritesManager>(
              builder: (context, favManager, _) {
                final favCount = favManager.favorites.length;
                return Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.redAccent),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const FavoritesPage()),
                          );
                        },
                      ),
                    ),
                    if (favCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$favCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Hoş Geldiniz 👋",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      text: "Hangi mekanın\n",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        height: 1.2,
                        fontFamily: 'SFPro',
                      ),
                      children: [
                        TextSpan(
                          text: "fiyatını",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        TextSpan(text: " arıyorsun?"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Modern Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterPlaces,
                      decoration: InputDecoration(
                        hintText: "Mekan veya mutfak ara...",
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                        prefixIcon: const Icon(Icons.search_rounded,
                            color: Colors.redAccent),
                        suffixIcon: searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.close_rounded,
                                    color: Colors.grey),
                                onPressed: () {
                                  _searchController.clear();
                                  _filterPlaces("");
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Category List
                  SizedBox(
                    height: 48,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        bool isSelected = selectedCategory == cat["label"];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: InkWell(
                            onTap: () => _filterByCategory(cat["label"]),
                            borderRadius: BorderRadius.circular(16),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.redAccent
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: isSelected
                                    ? null
                                    : Border.all(
                                        color:
                                            Colors.grey.withValues(alpha: 0.2)),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.redAccent
                                              .withValues(alpha: 0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Icon(
                                    cat["icon"] as IconData,
                                    size: 18,
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    cat["label"],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory == "Hepsi"
                            ? "Tüm Mekanlar"
                            : selectedCategory,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        "${filteredPlaces.length} mekan",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Empty State
          if (filteredPlaces.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  children: [
                    Icon(Icons.search_off_rounded,
                        size: 64, color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text(
                      "Sonuç bulunamadı",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Farklı bir arama terimi veya kategori deneyin.",
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

          // Place Tiles
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PlacesTile(
                    places: filteredPlaces[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PlaceDetailPage(place: filteredPlaces[index]),
                        ),
                      );
                    },
                  );
                },
                childCount: filteredPlaces.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
