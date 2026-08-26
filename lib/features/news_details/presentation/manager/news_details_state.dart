import 'package:myapplicationadvanced/features/genral_news/data/models/news_model.dart';

abstract class NewsDetailsState {}

class NewsDetailsInitial extends NewsDetailsState {}

class NewsDetailsLoading extends NewsDetailsState {}

class NewsDetailsSuccess extends NewsDetailsState {
  final NewsModel news;
  NewsDetailsSuccess({required this.news});
}

class NewsDetailsFailure extends NewsDetailsState {
  final String errMessage;
  NewsDetailsFailure({required this.errMessage});
}
