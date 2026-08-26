import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';

abstract class FetchNewsState {}

class FetchNewsInitial extends FetchNewsState {}

class FetchNewsLoading extends FetchNewsState {}

class FetchNewsSuccess extends FetchNewsState {
  final List<NewsModel> newsModel;
  FetchNewsSuccess({required this.newsModel});
}

class FetchNewsFailure extends FetchNewsState {
  final String errMessage;
  FetchNewsFailure({required this.errMessage});
}
