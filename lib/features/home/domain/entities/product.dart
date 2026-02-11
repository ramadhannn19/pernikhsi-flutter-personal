class Product {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final double rating;
  final int reviewCount;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.isFavorite,
  });
}
