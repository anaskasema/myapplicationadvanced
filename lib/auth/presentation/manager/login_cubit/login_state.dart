part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
	LoginFailure({required this.errorMessage});

	final String errorMessage;
}

final class LoginLoading extends LoginState {}
