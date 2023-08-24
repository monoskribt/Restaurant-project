import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sushi_shop_project/filters_widget/tools/category_filter.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;

  const Filter({
    this.categoryFilters = const <CategoryFilter>[],
  });

  Filter copyWith ({
    List<CategoryFilter>? categoryFilters,
  }) {
    return Filter(categoryFilters: categoryFilters ?? this.categoryFilters);
  }

  @override
  List<Object?> get props => [categoryFilters];
}