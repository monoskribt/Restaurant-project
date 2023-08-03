import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState.initial());


  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is AddCategoryEvent) {
      _onAddCategoryEvent(event);
    } else if (event is RemoveCategoryEvent) {
      _onRemoveCategoryEvent(event);
    } else if (event is ApplyFilterEvent) {
      yield FilterState([...event.selectedCategory]);
    }
  }

  void _onAddCategoryEvent(AddCategoryEvent event) {
    final newSelectedCategory = List<String>.from(state.selectedCategory);
    newSelectedCategory.add(event.category);
    emit(FilterState(newSelectedCategory));
  }

  void _onRemoveCategoryEvent(RemoveCategoryEvent event) {
    final newSelectedCategory = List<String>.from(state.selectedCategory);
    newSelectedCategory.remove(event.category);
    emit(FilterState(newSelectedCategory));
  }
}
