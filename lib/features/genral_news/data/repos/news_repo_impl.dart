import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/core/services/api_service.dart';
import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';
import 'package:myapplicationadvanced/features/genral_news/data/repos/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final ApiService apiService;
  NewsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<NewsModel>>> fetchNews({required String category}) async {
    try {
      var response = await apiService.get(
        'https://api.thenewsapi.com/v1/news/all',
        queryParameters: {
          'api_token': 'mMxOQOvEZtutpjfsaP2QM9vs44AZfZbGfIFGYtyW',
          'language': 'en',
          'categories': category,
        },
      );
      
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> dataNews = jsonData['data'];
      List<NewsModel> newsList = dataNews.map((e) => NewsModel.fromJson(json: e)).toList();
      
      return right(newsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
