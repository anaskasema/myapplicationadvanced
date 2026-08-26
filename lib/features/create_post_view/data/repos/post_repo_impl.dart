import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/core/services/api_service.dart';
import 'package:myapplicationadvanced/models/post_model.dart';
import 'package:myapplicationadvanced/features/create_post_view/data/repos/post_repo.dart';

class PostRepoImpl implements PostRepo {
  final ApiService apiService;
  PostRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> createPost({required PostModel postData}) async {
    try {
      await apiService.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: postData.toJson(),
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
