part of 'filter_bloc.dart';

class FilterState {
  final List<String> selectedCategory;

  FilterState(this.selectedCategory);

  FilterState.initial() : selectedCategory = [];
}