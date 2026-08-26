import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/categories_news/data/repos/categories_repo.dart';
import 'package:myapplicationadvanced/features/categories_news/presentation/manager/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  void getCategories() {
    emit(CategoriesLoading());
    final categories = categoriesRepo.fetchCategories();
    emit(CategoriesSuccess(categories: categories));
  }
}
