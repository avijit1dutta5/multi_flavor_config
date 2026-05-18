class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  final int id;
  final String title;
  final double price;
  final String imageUrl;
  final String category;
}
