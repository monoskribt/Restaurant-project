class OrderModel {
  final String image;
  final String name;
  final double price;
  int quantity;
  final String comment;

  OrderModel({
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 0,
    required this.comment,
  });
}
