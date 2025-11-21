class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  bool isFavourite;
  bool inCart;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.isFavourite = false,
    this.inCart = false,
    this.quantity = 1,
  });
}
