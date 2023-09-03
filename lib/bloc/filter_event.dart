part of 'filter_bloc.dart';

@immutable
abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class FilterLoad extends FiltersEvent {
  @override
  List<Object> get props => [];
}

class ProductTypeFilterUpdated extends FiltersEvent {
  final ProductTypeFilter productTypeFilter;

   ProductTypeFilterUpdated({required this.productTypeFilter});

  @override
  List<Object> get props => [productTypeFilter];
}

class CategoryFilterUpdated extends FiltersEvent {
  final CategoryFilter categoryFilter;

   CategoryFilterUpdated({required this.categoryFilter});

  @override
  List<Object> get props => [categoryFilter];
}
