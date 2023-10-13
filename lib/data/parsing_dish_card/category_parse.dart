import 'package:sushi_shop_project/data/parsing_dish_card/dish_parse.dart';

class CategoryParse {
  final String id;
  final String name;
  final List<DishParse> dishes;

  CategoryParse({
    required this.id,
    required this.name,
    required this.dishes});
}