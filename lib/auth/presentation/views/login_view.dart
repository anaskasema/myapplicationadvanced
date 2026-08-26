import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:myapplicationadvanced/auth/presentation/views/widgets/login_view_body.dart';
import 'package:myapplicationadvanced/core/widgets/helpers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              customSnackBar(
                context,
                content: state.errorMessage,
                color: Colors.red,
              );
            }
            if (state is LoginSuccess) {
              customSnackBar(
                context,
                content: 'user logged in successfuly',
                color: Colors.green,
              );
            }
          },
          builder: (context, state) {
            return LoginViewBody();
          },
        ),
      ),
    );
  }
}
