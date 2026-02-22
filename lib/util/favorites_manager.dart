import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager extends ChangeNotifier {
  static const String _favoritesKey = 'favorite_places';
  Set<String> _favorites = {};

  FavoritesManager() {
    _loadFavorites();
  }

  Set<String> get favorites => _favorites;

  bool isFavorite(String placeName) => _favorites.contains(placeName);

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> saved = prefs.getStringList(_favoritesKey) ?? [];
    _favorites = saved.toSet();
    notifyListeners();
  }

  Future<void> toggleFavorite(String placeName) async {
    if (_favorites.contains(placeName)) {
      _favorites.remove(placeName);
    } else {
      _favorites.add(placeName);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, _favorites.toList());
  }
}
