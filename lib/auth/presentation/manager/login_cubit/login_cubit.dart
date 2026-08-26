import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/data/models/user_model.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthRepo? authRepo})
    : _authRepo = authRepo ?? FirebaseAuthService(),
      super(LoginInitial());

  final AuthRepo _authRepo;

  Future<void> login({required UserModel user}) async {
    emit(LoginLoading());
    try {
      await _authRepo.login(user: user);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (error) {
      emit(LoginFailure(errorMessage: error.message ?? 'Login failed'));
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      await _authRepo.signInWithGoogle();
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }
}
