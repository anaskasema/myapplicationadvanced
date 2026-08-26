import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/core/services/get_it_service.dart';
import 'package:myapplicationadvanced/features/categories_news/data/repos/categories_repo.dart';
import 'package:myapplicationadvanced/features/categories_news/presentation/manager/categories_cubit.dart';
import 'package:myapplicationadvanced/features/genral_news/data/repos/news_repo.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/manager/fetch_news_cubit.dart';
import 'package:myapplicationadvanced/features/create_post_view/data/repos/post_repo.dart';
import 'package:myapplicationadvanced/features/create_post_view/presentation/manager/create_post_cubit.dart';
import 'package:myapplicationadvanced/features/signup_view/data/repos/auth_repo.dart';
import 'package:myapplicationadvanced/features/signup_view/presentation/manager/signup_cubit.dart';
import 'package:myapplicationadvanced/core/routing/app_routes.dart';
import 'package:myapplicationadvanced/core/routing/routes_name.dart';
import 'package:myapplicationadvanced/core/services/shared_preferences_singleton.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  await Prefs.getInstance(); // تهيئة التخزين المحلي
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(
            getIt.get<CategoriesRepo>(), // الحصول على الـ Repo من GetIt
          )..getCategories(),
        ),
        BlocProvider(
          create: (context) => SignupCubit(
            getIt.get<AuthRepo>(), // الحصول على الـ Repo من GetIt
          ),
        ),
        BlocProvider(
          create: (context) => FetchNewsCubit(
            getIt.get<NewsRepo>(), // الحصول على الـ Repo من GetIt
          ),
        ),
        BlocProvider(
          create: (context) => CreatePostCubit(
            getIt.get<PostRepo>(), // الحصول على الـ Repo من GetIt
          ),
        ),
      ],
      child: MaterialApp(
        initialRoute: RoutesName.loginView,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
