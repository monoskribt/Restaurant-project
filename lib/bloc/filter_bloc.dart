import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../filters_widget/models/filter_model.dart';
import '../filters_widget/tools/category_filter.dart';
import 'filter_state.dart';

part 'filter_event.dart';

class FilterBloc extends Bloc<FiltersEvent, FiltersState> {
  FilterBloc() : super(FilterLoading());

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FilterLoad) {
      yield* _mapFilterLoadToState();
    }
    if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    }
  }

  Stream<FiltersState> _mapFilterLoadToState() async* {
    yield FilterLoaded(filter: Filter(categoryFilters: CategoryFilter.filters));
  }

  Stream<FiltersState> _mapCategoryFilterUpdatedToState(
    CategoryFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      yield FilterLoaded(
        filter: Filter(
          categoryFilters: updatedCategoryFilters
        )
      );
    }
  }
}
