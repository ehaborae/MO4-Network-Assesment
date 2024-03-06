import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_case_base.dart';
import '../entity/post.dart';
import '../repository_base/post_repository_base.dart';

class PostUseCase extends UseCaseBase<Post> {
  final PostsRepositoryBase repository;
  final int postId;

  PostUseCase({
    required this.repository,
    required this.postId,
  });

  @override
  Future<Either<Failure, Post>> call() async {
    return await repository.getPost(postId);
  }
}
