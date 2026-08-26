import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/news_details/data/repos/news_details_repo.dart';
import 'package:myapplicationadvanced/features/news_details/presentation/manager/news_details_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  final NewsDetailsRepo newsDetailsRepo;
  NewsDetailsCubit(this.newsDetailsRepo) : super(NewsDetailsInitial());

  // دالة لمحاكاة جلب تفاصيل إضافية
  void getNewsDetails(dynamic news) {
    emit(NewsDetailsSuccess(news: news));
  }
}
