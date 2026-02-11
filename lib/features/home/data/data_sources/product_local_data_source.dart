import '../../domain/entities/product.dart';

class ProductLocalDataSource {
  List<Product> getProducts() {
    return const [
      Product(
        id: 1,
        name: "Gamis Wanita HSI",
        imageUrl: "assets/images/png/image-12.png",
        price: 329000,
        rating: 4.8,
        reviewCount: 124,
        isFavorite: false,
      ),
      Product(
        id: 2,
        name: "Baju panjang ",
        imageUrl: "assets/images/png/image-12.png",
        price: 259000,
        rating: 8.0,
        reviewCount: 90,
        isFavorite: true,
      ),
      Product(
        id: 3,
        name: "Baju panjang ",
        imageUrl: "assets/images/png/image-12.png",
        price: 259000,
        rating: 8.0,
        reviewCount: 90,
        isFavorite: true,
      ),
      Product(
        id: 4,
        name: "Baju panjang",
        imageUrl: "assets/images/png/image-12.png",
        price: 259000,
        rating: 8.0,
        reviewCount: 90,
        isFavorite: true,
      ),
      Product(
        id: 5,
        name: "Baju panjang ",
        imageUrl: "assets/images/png/image-12.png",
        price: 259000,
        rating: 8.0,
        reviewCount: 90,
        isFavorite: true,
      ),
    ];
  }
}
