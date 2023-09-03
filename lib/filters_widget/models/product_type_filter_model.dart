import 'package:equatable/equatable.dart';

class ProductType extends Equatable {
  final int id;
  final String titleProduct;

  const ProductType({
    required this.titleProduct,
    required this.id,
  });

  @override
  List<Object?> get props => [titleProduct];

  static List<ProductType> productType = const [
    ProductType(
      id: 1,
      titleProduct: 'Pizza',
    ),
    ProductType(
      id: 2,
      titleProduct: 'Burger',
    ),
    ProductType(
      id: 3,
      titleProduct: 'Salad',
    ),
    ProductType(
      id: 4,
      titleProduct: 'Soup',
    ),
    ProductType(
      id: 5,
      titleProduct: 'Chicken',
    ),
    ProductType(
      id: 6,
      titleProduct: 'Grill',
    ),
    ProductType(
      id: 7,
      titleProduct: 'Breakfast',
    ),
  ];
}
