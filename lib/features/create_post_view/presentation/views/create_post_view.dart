import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/core/widgets/custom_circule_progressIndicator.dart';
import 'package:myapplicationadvanced/features/create_post_view/presentation/manager/create_post_cubit.dart';
import 'package:myapplicationadvanced/features/create_post_view/presentation/manager/create_post_state.dart';
import 'package:myapplicationadvanced/models/post_model.dart';
import 'package:myapplicationadvanced/core/widgets/custom_text_form_field.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});
  static String routeName = 'create_post_view';
  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Post'), centerTitle: true, backgroundColor: Colors.amber),
      body: BlocListener<CreatePostCubit, CreatePostState>(
        listener: (context, state) {
          if (state is CreatePostSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
            title.clear(); body.clear(); userId.clear();
          } else if (state is CreatePostFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey, autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextFormField(hintText: 'Title', controller: title),
                  const SizedBox(height: 20),
                  CustomTextFormField(hintText: 'Body', controller: body),
                  const SizedBox(height: 20),
                  CustomTextFormField(hintText: 'user Id', controller: userId),
                  const SizedBox(height: 20),
                  BlocBuilder<CreatePostCubit, CreatePostState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        onPressed: state is CreatePostLoading ? null : () {
                          if (formKey.currentState!.validate()) {
                            context.read<CreatePostCubit>().createPost(postData: PostModel(title: title.text, body: body.text, userId: int.parse(userId.text)));
                          }
                          setState(() => autovalidateMode = AutovalidateMode.always);
                        },
                        child: state is CreatePostLoading ? const CustomCircularProgressIndicator(color: Colors.white) : const Text('Create Post', style: TextStyle(color: Colors.white, fontSize: 20)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
