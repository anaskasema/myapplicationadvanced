import 'package:myapplicationadvanced/models/post_model.dart';

abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {
  final PostModel postModel;
  final String message;
  CreatePostSuccess({required this.postModel, required this.message});
}

class CreatePostFailure extends CreatePostState {
  final String errMessage;
  CreatePostFailure({required this.errMessage});
}
