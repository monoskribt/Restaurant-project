import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersState {
  final String selectedCategory;

  FiltersState(this.selectedCategory);

  FiltersState copyWith({
    String? selectedCategory,
  }) {
    return FiltersState(
      selectedCategory ?? this.selectedCategory,
    );
  }
}

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(FiltersState(''));

  void updateSelectedCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }
}
