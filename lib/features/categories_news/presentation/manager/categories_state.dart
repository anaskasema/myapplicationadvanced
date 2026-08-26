import 'package:myapplicationadvanced/features/categories_news/data/models/category_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesSuccess({required this.categories});
}
