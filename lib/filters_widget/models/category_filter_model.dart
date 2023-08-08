import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String titleProduct;

  const Category({
    required this.titleProduct,
    required this.id,
  });

  @override
  List<Object?> get props => [titleProduct];

  static List<Category> categories = const [
    Category(
      id: 1,
      titleProduct: 'Pizza',
    ),
    Category(
      id: 2,
      titleProduct: 'Burger',
    ),
    Category(
      id: 3,
      titleProduct: 'Salad',
    ),
    Category(
      id: 4,
      titleProduct: 'Soup',
    ),
    Category(
      id: 5,
      titleProduct: 'Chicken',
    ),
    Category(
      id: 6,
      titleProduct: 'Grill',
    ),
    Category(
      id: 7,
      titleProduct: 'Breakfast',
    ),
  ];
}
