import 'package:dartz/dartz.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/features/signup_view/data/models/user_model.dart';
import 'package:myapplicationadvanced/features/signup_view/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, void>> signup({required UserModel user}) async {
    try {
      // Simulate API Call
      await Future.delayed(const Duration(seconds: 1));
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
