import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/core/widgets/custom_circule_progressIndicator.dart';
import 'package:myapplicationadvanced/core/widgets/custom_text_form_field.dart';
import 'package:myapplicationadvanced/features/signup_view/data/models/user_model.dart';
import 'package:myapplicationadvanced/features/signup_view/presentation/manager/signup_cubit.dart';
import 'package:myapplicationadvanced/features/signup_view/presentation/manager/signup_state.dart';
import 'package:myapplicationadvanced/widgets/CustomButton.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static String routeName = 'signup_view';

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Account Created Successfully!'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating));
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.app_registration, size: 80, color: Colors.green),
              const SizedBox(height: 20),
              const Text('Create Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              CustomTextFormField(
                  hintText: 'User Name',
                  labelText: 'Enter Your Username',
                  icon: Icons.person,
                  controller: username),
              const SizedBox(height: 16),
              CustomTextFormField(
                  hintText: 'Password',
                  labelText: 'Enter your Password',
                  icon: Icons.lock,
                  obscureText: true,
                  controller: password),
              const SizedBox(height: 24),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  if (state is SignupLoading) {
                    return const CustomCircularProgressIndicator();
                  }
                  return CustomButton(onPressed: () {
                    context.read<SignupCubit>().signup(UserModel(
                        username: username.text, password: password.text));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
