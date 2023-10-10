import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sushi_shop_project/models/filter_model.dart';
import 'package:sushi_shop_project/screens/filters/tools/category_filter.dart';
import 'package:sushi_shop_project/screens/filters/tools/product_type_filter.dart';
import 'filter_state.dart';

part 'filter_event.dart';

class FilterBloc extends Bloc<FiltersEvent, FiltersCategoryState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterLoad>((event, emit) {
      _mapFilterLoadToState().forEach(emit);
    });
    on<ProductTypeFilterUpdated>((event, emit) {
      _mapProductTypeFilterUpdatedToState(event, state).forEach(emit);
    });
    on<CategoryFilterUpdated>((event, emit) {
      _mapCategoryFilterUpdatedToState(event, state).forEach(emit);
    });
  }



  @override
  Stream<FiltersCategoryState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FilterLoad) {
      yield* _mapFilterLoadToState();
    }
    if (event is ProductTypeFilterUpdated) {
      yield* _mapProductTypeFilterUpdatedToState(event, state);
    }
    if(event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    }
  }

  Stream<FiltersCategoryState> _mapFilterLoadToState() async* {
    yield FilterLoaded(
        filter: Filter(
            productTypeFilters: ProductTypeFilter.filters,
          categoryFilters: CategoryFilter.filters,
        )
    );
  }

  Stream<FiltersCategoryState> _mapProductTypeFilterUpdatedToState(
    ProductTypeFilterUpdated event,
    FiltersCategoryState state,
  ) async* {
    if (state is FilterLoaded) {
      final List<ProductTypeFilter> updatedProductTypeFilters =
          state.filter.productTypeFilters.map((productTypeFilter) {
        return productTypeFilter.id == event.productTypeFilter.id
            ? event.productTypeFilter
            : productTypeFilter;
      }).toList();

      yield FilterLoaded(
          filter: Filter(productTypeFilters: updatedProductTypeFilters));
    }
  }

  Stream<FiltersCategoryState> _mapCategoryFilterUpdatedToState(
      CategoryFilterUpdated event,
      FiltersCategoryState state,
      ) async* {
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
      state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      yield FilterLoaded(
          filter: Filter(categoryFilters: updatedCategoryFilters));
    }
  }
}
