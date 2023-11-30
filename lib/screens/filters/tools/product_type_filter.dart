import 'package:equatable/equatable.dart';
import 'package:Foodbox/models/product_type_filter_model.dart';

class ProductTypeFilter extends Equatable {
  final int id;
  final ProductType productType;
  final bool value;

  const ProductTypeFilter({
    required this.id,
    required this.productType,
    required this.value,
  });

  ProductTypeFilter copyWith({
    int? id,
    ProductType? productType,
    bool? value,
  }) {
    return ProductTypeFilter(
      id: id ?? this.id,
      productType: productType ?? this.productType,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
    id,
    productType,
    value,
  ];

  static List<ProductTypeFilter> filters = ProductType.productType
      .map((category) =>
      ProductTypeFilter(id: category.id, productType: category, value: false))
      .toList();
}
