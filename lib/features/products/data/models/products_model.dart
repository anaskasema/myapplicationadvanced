class ProductsModel {
  final String? id;
  final String name;
  final String description;
  final int untis;
  final String category;
  final double price;

  ProductsModel({
    this.id,
    required this.name,
    required this.description,
    required this.untis,
    required this.category,
    required this.price,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      untis: json['untis'],
      category: json['category'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'untis': untis,
      'category': category,
      'price': price,
    };
  }
}
