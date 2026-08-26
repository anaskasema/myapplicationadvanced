import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplicationadvanced/models/post_model.dart';
import 'package:myapplicationadvanced/features/create_post_view/data/repos/post_repo.dart';
import 'package:myapplicationadvanced/features/create_post_view/presentation/manager/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final PostRepo postRepo;
  CreatePostCubit(this.postRepo) : super(CreatePostInitial());

  Future<void> createPost({required PostModel postData}) async {
    emit(CreatePostLoading());
    var result = await postRepo.createPost(postData: postData);

    result.fold(
      (failure) {
        emit(CreatePostFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(CreatePostSuccess(
          postModel: postData,
          message: 'Success! Your post "${postData.title}" is live.',
        ));
      },
    );
  }
}
