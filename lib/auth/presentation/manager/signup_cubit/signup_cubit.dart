import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/data/models/user_model.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo.dart';
import 'package:myapplicationadvanced/auth/data/repos/auth_repo_impl.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({AuthRepo? authRepo})
      : _authRepo = authRepo ?? FirebaseAuthService(),
        super(SignupInitial());

  final AuthRepo _authRepo;

  Future<void> signup({required UserModel user}) async {
    emit(SignupLoading());
    try {
      await _authRepo.signup(user: user);
      emit(SignupSuccess());
    } on FirebaseAuthException catch (error) {
      emit(SignupFailure(errorMessage: error.message ?? 'Signup failed'));
    } catch (error) {
      emit(SignupFailure(errorMessage: error.toString()));
    }
  }
}
