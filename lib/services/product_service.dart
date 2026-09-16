import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  // DummyJSON — free REST API with a large product catalog.
  static const String baseUrl = 'https://dummyjson.com';

  // Handles both response shapes: a raw array or { "products": [...] }
  List<Product> _parseList(dynamic decoded) {
    final List<dynamic> items = (decoded is Map && decoded['products'] is List)
        ? decoded['products'] as List<dynamic>
        : decoded as List<dynamic>;
    return items.map((json) => Product.fromJson(json)).toList();
  }

  // Fetch all products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products?limit=100'));

      if (response.statusCode == 200) {
        return _parseList(json.decode(response.body));
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Fetch products by category
  Future<List<Product>> fetchProductsByCategory(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/category/$category'),
      );

      if (response.statusCode == 200) {
        return _parseList(json.decode(response.body));
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  // Fetch single product
  Future<Product> fetchProduct(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

  // Fetch all categories
  Future<List<String>> fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/categories'),
      );

      if (response.statusCode == 200) {
        final dynamic decoded = json.decode(response.body);
        final List<dynamic> items = decoded is List ? decoded : (decoded['categories'] ?? []);
        return items
            .map((e) => e is Map ? (e['name'] ?? e['slug'] ?? '').toString() : e.toString())
            .where((s) => s.isNotEmpty)
            .toList();
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
