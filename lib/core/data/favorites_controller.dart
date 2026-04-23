import 'package:coffee_shop/core/models/product_model.dart';

class FavoritesController {
  static final FavoritesController _instance = FavoritesController._internal();
  factory FavoritesController() => _instance;
  FavoritesController._internal();

  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product)) {
      _favorites.removeWhere((p) => p.id == product.id);
    } else {
      _favorites.add(product);
    }
  }

  bool isFavorite(ProductModel product) {
    return _favorites.any((p) => p.id == product.id);
  }
}
