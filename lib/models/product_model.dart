// models/product_model.dart
class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      description: json['stock'],
      createdAt: json['stock'],
      updatedAt: json['stock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
      'description': stock,
      'createdAt': stock,
      'updatedAt': stock,
    };
  }
}
