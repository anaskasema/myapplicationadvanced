import 'package:flutter/material.dart';
import 'package:myapplicationadvanced/features/categories_news/data/models/category_model.dart';

abstract class CategoriesRepo {
  List<CategoryModel> fetchCategories();
}

class CategoriesRepoImpl implements CategoriesRepo {
  @override
  List<CategoryModel> fetchCategories() {
    return [
      CategoryModel(name: 'general', icon: Icons.public),
      CategoryModel(name: 'sports', icon: Icons.sports),
      CategoryModel(name: 'business', icon: Icons.business_sharp),
      CategoryModel(name: 'health', icon: Icons.health_and_safety_rounded),
      CategoryModel(name: 'entertainment', icon: Icons.movie_filter_rounded),
    ];
  }
}
