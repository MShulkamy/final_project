import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  // Calculate subtotal
  double get subtotal {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  // Calculate shipping (free shipping over $100)
  double get shipping {
    return subtotal > 100 ? 0.0 : 10.0;
  }

  // Calculate total
  double get total {
    return subtotal + shipping;
  }

  // Check if product is in cart
  bool isInCart(int productId) {
    return _items.any((item) => item.id == productId);
  }

  // Get item quantity
  int getItemQuantity(int productId) {
    final item = _items.firstWhere(
      (item) => item.id == productId,
      orElse: () => CartItem(
        id: 0,
        title: '',
        price: 0,
        image: '',
      ),
    );
    return item.id == 0 ? 0 : item.quantity;
  }

  // Add item to cart
  void addItem(Product product, {String size = 'M'}) {
    final existingIndex = _items.indexWhere((item) => item.id == product.id);

    if (existingIndex >= 0) {
      // Item exists, increase quantity
      _items[existingIndex].quantity++;
    } else {
      // Add new item
      _items.add(CartItem(
        id: product.id,
        title: product.title,
        price: product.price,
        image: product.image,
        size: size,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  // Remove item from cart
  void removeItem(int productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  // Update item quantity
  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }

    final index = _items.indexWhere((item) => item.id == productId);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  // Increase quantity
  void increaseQuantity(int productId) {
    final index = _items.indexWhere((item) => item.id == productId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // Decrease quantity
  void decreaseQuantity(int productId) {
    final index = _items.indexWhere((item) => item.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        removeItem(productId);
      }
      notifyListeners();
    }
  }

  // Clear cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
