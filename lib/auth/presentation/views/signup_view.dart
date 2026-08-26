import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:myapplicationadvanced/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:myapplicationadvanced/core/widgets/helpers.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routName = 'signup_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupFailure) {
              customSnackBar(
                context,
                content: state.errorMessage,
                color: Colors.red,
              );
            }
            if (state is SignupSuccess) {
              customSnackBar(
                context,
                content: 'user created successfuly',
                color: Colors.green,
              );
            }
          },
          builder: (context, state) {
            return SignupViewBody();
          },
        ),
      ),
    );
  }
}
