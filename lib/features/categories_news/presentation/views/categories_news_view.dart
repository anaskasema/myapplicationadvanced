import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo_impl.dart';
import 'package:myapplicationadvanced/core/routing/routes_name.dart';
import 'package:myapplicationadvanced/core/services/get_it_service.dart';
import 'package:myapplicationadvanced/core/widgets/custom_circule_progressIndicator.dart';
import 'package:myapplicationadvanced/features/categories_news/presentation/manager/categories_cubit.dart';
import 'package:myapplicationadvanced/features/categories_news/presentation/manager/categories_state.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/manager/fetch_news_cubit.dart';
import 'package:myapplicationadvanced/widgets/category_news_item.dart';

class CategoriesNewsView extends StatelessWidget {
  const CategoriesNewsView({super.key});
  static String routeName = 'categories_news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 237, 228, 228),
      appBar: AppBar(
        title: const Text('News Categories'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              print('Logout button pressed');
              try {
                await getIt.get<FirebaseAuthService>().signOut();
                print('Sign out successful');
                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RoutesName.loginView,
                    (route) => false,
                  );
                }
              } catch (e) {
                print('Logout error: $e');
              }
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is CategoriesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<FetchNewsCubit>().fetchNews(
                          categories: state.categories[index].name);
                      Navigator.of(context).pushNamed(RoutesName.genralNewsView);
                    },
                    child: CategoryNewsItem(
                      categoriesIcons: state.categories[index].icon,
                      categories: state.categories[index].name,
                    ),
                  );
                },
              ),
            );
          }
          return const Center(child: Text('No Categories Found'));
        },
      ),
    );
  }
}
