import 'package:dartz/dartz.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/models/post_model.dart';

abstract class PostRepo {
  Future<Either<Failure, void>> createPost({required PostModel postData});
}
