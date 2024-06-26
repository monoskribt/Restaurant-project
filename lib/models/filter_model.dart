import 'package:equatable/equatable.dart';
import 'package:Foodbox/screens/filters/tools/category_filter.dart';
import 'package:Foodbox/screens/filters/tools/product_type_filter.dart';



class Filter extends Equatable {
  final List<ProductTypeFilter> productTypeFilters;
  final List<CategoryFilter> categoryFilters;

  const Filter({
    this.productTypeFilters = const <ProductTypeFilter>[],
    this.categoryFilters = const <CategoryFilter>[],
  });

  Filter copyWith({
    List<ProductTypeFilter>? productTypeFilters,
    List<CategoryFilter>? categoryFilters,
  }) {
    return Filter(
      productTypeFilters: productTypeFilters ?? this.productTypeFilters,
      categoryFilters: categoryFilters ?? this.categoryFilters,
    );
  }

  @override
  List<Object?> get props => [productTypeFilters, categoryFilters];
}
