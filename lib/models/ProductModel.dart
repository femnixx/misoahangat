class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final List<String> categories;

  Product({
    required this.id, 
    required this.name, 
    required this.description, 
    required this.imageUrl, 
    required this.categories, 
    required this.isAvailable,
    required this.price
    });
}


