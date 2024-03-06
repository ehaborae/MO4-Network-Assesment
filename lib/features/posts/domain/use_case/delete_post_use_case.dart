import 'package:dartz/dartz.dart';

import '../repository_base/post_repository_base.dart';
import '/core/error/failure.dart';
import '/core/utils/use_case_base.dart';

class DeletePostUseCase extends UseCaseBase<void> {
  final PostsRepositoryBase repository;
  final int postId;

  DeletePostUseCase({
    required this.repository,
    required this.postId,
  });

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.deletePost(postId);
  }
}
