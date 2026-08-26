import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';
import 'package:myapplicationadvanced/features/news_details/data/repos/news_details_repo_impl.dart';
import 'package:myapplicationadvanced/features/news_details/presentation/manager/news_details_cubit.dart';
import 'package:myapplicationadvanced/features/news_details/presentation/manager/news_details_state.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});
  static String routeName = 'news_details';

  @override
  Widget build(BuildContext context) {
    // استلام بيانات الخبر الممررة
    final newsModel = ModalRoute.of(context)!.settings.arguments as NewsModel;

    return BlocProvider(
      create: (context) => NewsDetailsCubit(NewsDetailsRepoImpl())..getNewsDetails(newsModel),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News Details'),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: BlocBuilder<NewsDetailsCubit, NewsDetailsState>(
          builder: (context, state) {
            if (state is NewsDetailsSuccess) {
              final news = state.news;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      news.image_url,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.broken_image, size: 50)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(news.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(news.description,
                          style: const TextStyle(fontSize: 16, height: 1.5)),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
