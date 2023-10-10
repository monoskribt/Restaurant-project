import 'package:flutter_bloc/flutter_bloc.dart';

enum SortingDishesState {
  allDishes,
  mostPopular,
  salad,
  pasta
}

class SortingDishesCubit extends Cubit<SortingDishesState> {
  SortingDishesCubit() : super(SortingDishesState.allDishes);

  void selectCategory(SortingDishesState category) {
    emit(category);
  }
}
