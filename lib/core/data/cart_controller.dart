import 'package:coffee_shop/core/models/cart_item_model.dart';
import 'package:coffee_shop/core/models/product_model.dart';

class CartController {
  static final CartController _instance = CartController._internal();
  factory CartController() => _instance;
  CartController._internal();

  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  double get totalPrice {
    return _items.fold(0, (total, item) => total + (item.product.price * item.quantity));
  }

  void addToCart(ProductModel product, {int quantity = 1}) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity += quantity;
        return;
      }
    }
    _items.add(CartItemModel(product: product, quantity: quantity));
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }

  void clearCart() {
    _items.clear();
  }
}
