import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  List<String> selectedCategories = [];
  FiltersCubit() : super(FiltersUpdated([]));

  void toggleCategory(String category) {
    final currentState = state;

    if (currentState is FiltersUpdated) {
      final updatedCategories = List<String>.from(currentState.selectedCategories);

      if (updatedCategories.contains(category)) {
        updatedCategories.remove(category);
      } else {
        updatedCategories.add(category);
      }
      selectedCategories = updatedCategories;
      emit(FiltersUpdated(updatedCategories));
    }
  }

  void applyFilters(List<String> selectedCategories) {
    emit(FiltersApplied(selectedCategories));
  }
}
