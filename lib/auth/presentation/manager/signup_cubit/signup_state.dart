part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupFailure extends SignupState {
	SignupFailure({required this.errorMessage});

	final String errorMessage;
}

final class SignupLoading extends SignupState {}
