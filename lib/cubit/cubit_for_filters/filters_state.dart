part of 'filters_cubit.dart';

@immutable
abstract class FiltersState {}

class FiltersInitial extends FiltersState {}

class FiltersUpdated extends FiltersState {
  final List<String> selectedCategories;

  FiltersUpdated(this.selectedCategories);
}

class FiltersApplied extends FiltersState {
  final List<String> selectedCategories;

  FiltersApplied(this.selectedCategories);
}
