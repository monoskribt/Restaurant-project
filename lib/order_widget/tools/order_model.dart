class OrderModel {
  final String image;
  final String name;
  final double rating;
  final int review;
  final double price;
  int quantity;

  OrderModel({
    required this.image,
    required this.name,
    required this.rating,
    required this.review,
    required this.price,
    required this.quantity,
  });
}