class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final reviews = json['reviews'];
    final rating = Rating.fromJson(json['rating']);

    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category']?.toString() ?? '',
      image: json['image'] ?? json['thumbnail'] ?? '',
      rating: (rating.count == 0 && reviews is List && reviews.isNotEmpty)
          ? Rating(rate: rating.rate, count: reviews.length)
          : rating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(dynamic json) {
    if (json is num) {
      return Rating(rate: json.toDouble(), count: 0);
    }
    if (json is Map) {
      return Rating(
        rate: (json['rate'] ?? 0.0).toDouble(),
        count: json['count'] ?? 0,
      );
    }
    return Rating(rate: 0.0, count: 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
