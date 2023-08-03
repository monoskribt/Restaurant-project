part of 'filter_bloc.dart';

abstract class FilterEvent {}

class AddCategoryEvent extends FilterEvent {
  final String category;

  AddCategoryEvent(this.category);
}

class RemoveCategoryEvent extends FilterEvent {
  final String category;

  RemoveCategoryEvent(this.category);
}

class ApplyFilterEvent extends FilterEvent {
  final List<String> selectedCategory;

  ApplyFilterEvent(this.selectedCategory);
}
