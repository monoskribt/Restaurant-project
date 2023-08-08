

import 'package:equatable/equatable.dart';

import '../filters_widget/models/filter_model.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FilterLoading extends FiltersState {}

class FilterLoaded extends FiltersState {
  final Filter filter;

  FilterLoaded({
    this.filter = const Filter(),
  });

  @override
  List<Object> get props => [filter];
}