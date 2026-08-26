import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/auth/data/models/user_model.dart';
import 'package:myapplicationadvanced/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:myapplicationadvanced/core/widgets/custom_button.dart';
import 'package:myapplicationadvanced/core/widgets/custom_text_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              SizedBox(height: 10),
              CustomTextField(
                controller: email,
                labelText: 'Email',
                hintText: 'Email',
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                      .hasMatch(value.trim())) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Password'),
              SizedBox(height: 10),
              CustomTextField(
                controller: password,
                labelText: 'Password',
                hintText: 'Password',
                icon: Icons.password,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Create',
                onPressed: () async {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                  if (!formKey.currentState!.validate()) return;
                  await context.read<SignupCubit>().signup(
                        user: UserModel(
                          email: email.text.trim(),
                          password: password.text,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
