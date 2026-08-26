import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/genral_news/data/repos/news_repo.dart';
import 'package:myapplicationadvanced/features/genral_news/presentation/manager/fetch_news_state.dart';

class FetchNewsCubit extends Cubit<FetchNewsState> {
  final NewsRepo newsRepo;
  FetchNewsCubit(this.newsRepo) : super(FetchNewsInitial());

  Future<void> fetchNews({required String categories}) async {
    emit(FetchNewsLoading());
    var result = await newsRepo.fetchNews(category: categories);
    
    result.fold(
      (failure) {
        emit(FetchNewsFailure(errMessage: failure.errMessage));
      },
      (news) {
        emit(FetchNewsSuccess(newsModel: news));
      },
    );
  }
}
