import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/core/widgets/custom_circule_progressIndicator.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/manager/fetch_news_cubit.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/manager/fetch_news_state.dart';
import 'package:myapplicationadvanced/widgets/news_item.dart';

class GenralNewsView extends StatelessWidget {
  const GenralNewsView({super.key});
  static String routeName = 'genral_news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 237, 228, 228),
      appBar: AppBar(title: const Text('News Feed')),
      body: BlocConsumer<FetchNewsCubit, FetchNewsState>(
        listener: (context, state) {
          if (state is FetchNewsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FetchNewsLoading) return const CustomCircularProgressIndicator();
          if (state is FetchNewsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: state.newsModel.length,
                itemBuilder: (context, index) => NewsWidget(newsModel: state.newsModel[index]),
              ),
            );
          }
          if (state is FetchNewsFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          }
          return const Center(child: Text('Select a category to load news'));
        },
      ),
    );
  }
}
