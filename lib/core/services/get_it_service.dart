import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapplicationadvanced/core/services/api_service.dart';
import 'package:myapplicationadvanced/features/categories_news/data/repos/categories_repo.dart';
import 'package:myapplicationadvanced/features/create_post_view/data/repos/post_repo.dart';
import 'package:myapplicationadvanced/features/create_post_view/data/repos/post_repo_impl.dart';
import 'package:myapplicationadvanced/features/genral_news/data/repos/news_repo.dart';
import 'package:myapplicationadvanced/features/genral_news/data/repos/news_repo_impl.dart';
import 'package:myapplicationadvanced/features/news_details/data/repos/news_details_repo.dart';
import 'package:myapplicationadvanced/features/news_details/data/repos/news_details_repo_impl.dart';
import 'package:myapplicationadvanced/features/signup_view/data/repos/auth_repo.dart';
import 'package:myapplicationadvanced/features/signup_view/data/repos/auth_repo_impl.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo_impl.dart' as global_auth_impl;

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.allowReassignment = true;
  // تزويد Dio كـ Singleton
  getIt.registerSingleton<Dio>(Dio());

  // تزويد ApiService
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));

  // تزويد الـ Repositories
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl(getIt.get<ApiService>()));
  
  getIt.registerSingleton<PostRepo>(PostRepoImpl(getIt.get<ApiService>()));
  
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

  getIt.registerSingleton<global_auth_impl.FirebaseAuthService>(global_auth_impl.FirebaseAuthService());
  
  getIt.registerSingleton<CategoriesRepo>(CategoriesRepoImpl());
  
  getIt.registerSingleton<NewsDetailsRepo>(NewsDetailsRepoImpl());
}
