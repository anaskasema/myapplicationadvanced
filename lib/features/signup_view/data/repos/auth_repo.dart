import 'package:dartz/dartz.dart';
import 'package:myapplicationadvanced/core/errors/failures.dart';
import 'package:myapplicationadvanced/features/signup_view/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signup({required UserModel user});
}
