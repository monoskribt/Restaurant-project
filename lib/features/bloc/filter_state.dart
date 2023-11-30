import 'package:equatable/equatable.dart';
import 'package:Foodbox/models/filter_model.dart';

abstract class FiltersCategoryState extends Equatable {
  const FiltersCategoryState();

  @override
  List<Object> get props => [];
}

class FilterLoading extends FiltersCategoryState {}

class FilterLoaded extends FiltersCategoryState {
  final Filter filter;

  const FilterLoaded({
    this.filter = const Filter(),
  });

  @override
  List<Object> get props => [filter];
}
