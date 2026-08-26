import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/features/signup_view/data/models/user_model.dart';
import 'package:myapplicationadvanced/features/signup_view/data/repos/auth_repo.dart';
import 'package:myapplicationadvanced/features/signup_view/presentation/manager/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup(UserModel user) async {
    emit(SignupLoading());
    var result = await authRepo.signup(user: user);
    result.fold(
      (failure) => emit(SignupFailure(errMessage: failure.errMessage)),
      (success) => emit(SignupSuccess()),
    );
  }
}
