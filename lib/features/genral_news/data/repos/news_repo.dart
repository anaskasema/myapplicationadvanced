import 'package:dartz/dartz.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';

abstract class NewsRepo {
  Future<Either<Failure, List<NewsModel>>> fetchNews({required String category});
}
