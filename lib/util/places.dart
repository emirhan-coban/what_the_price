class Places {
  final String name;
  final String price;
  final String imagePath;
  final String category;
  final String url;
  final String description;
  final double rating;

  Places({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.url,
    this.description = '',
    this.rating = 4.0,
  });
}
