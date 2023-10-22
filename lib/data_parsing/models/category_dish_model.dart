import 'package:sushi_shop_project/models/dish_model.dart';

class CategoryDishModel {
  final String id;
  final String name;
  final List<Dish> dishes;

  CategoryDishModel({
    required this.id,
    required this.name,
    required this.dishes});
}

