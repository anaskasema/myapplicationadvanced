import 'package:flutter/material.dart';
import 'package:myapplicationadvanced/core/routing/routes_name.dart';
import 'package:myapplicationadvanced/features/categories_news/presentation/views/categories_news_view.dart';
import 'package:myapplicationadvanced/features/create_post_view/presentation/views/create_post_view.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/views/genral_news_view.dart';
import 'package:myapplicationadvanced/features/news_details/presentation/views/news_details.dart';
import 'package:myapplicationadvanced/login_view.dart';
import 'package:myapplicationadvanced/signup_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case RoutesName.signupView:
        return MaterialPageRoute(builder: (_) => const SignupView());

      case RoutesName.genralNewsView:
        return MaterialPageRoute(builder: (_) => const GenralNewsView());

      case RoutesName.categoriesNewsView:
        return MaterialPageRoute(builder: (_) => const CategoriesNewsView());

      case RoutesName.newsDetails:
        return MaterialPageRoute(
          builder: (_) => const NewsDetails(),
          settings: settings, // لتمكين تمرير الـ Arguments
        );

      case RoutesName.createPostView:
        return MaterialPageRoute(builder: (_) => const CreatePostView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
