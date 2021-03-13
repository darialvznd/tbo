import 'package:tbo/models/category.dart';

abstract class CategoryState {}

class CategoryEmptyState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  List<Category> categories;
  CategoryLoadedState(this.categories);
}

class CategoryErrorState extends CategoryState {}
