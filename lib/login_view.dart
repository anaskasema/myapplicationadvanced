import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myapplicationadvanced/core/routing/routes_name.dart';

import 'auth/presentation/manager/login_cubit/login_cubit.dart';
import 'auth/presentation/views/widgets/login_view_body.dart';
import 'core/widgets/helpers.dart';

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
                color: Colors.black,
              );
            }
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(
                context,
                RoutesName.categoriesNewsView,
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
