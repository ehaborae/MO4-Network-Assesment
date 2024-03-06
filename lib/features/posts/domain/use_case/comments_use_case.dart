import 'package:dartz/dartz.dart';
import 'package:provider_demo/features/posts/domain/entity/comment.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_case_base.dart';
import '../repository_base/post_repository_base.dart';

class CommentsUseCase extends UseCaseBase<List<Comment>> {
  final PostsRepositoryBase repository;
  final int postId;

  CommentsUseCase({
    required this.repository,
    required this.postId,
  });

  @override
  Future<Either<Failure, List<Comment>>> call() async {
    return await repository.getComments(postId);
  }
}
