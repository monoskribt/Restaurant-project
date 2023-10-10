import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String titleCategories;
  final int id;

  const Category({
    required this.titleCategories,
    required this.id,
});

  @override
  List<Object?> get props => [titleCategories];

  static List<Category> categories = const [
    Category(
      titleCategories: "Food",
      id: 1,
    ),
    Category(
      titleCategories: "Drink",
      id: 2,
    ),
    Category(
      titleCategories: "Desert",
      id: 3
    ),
  ];
}
