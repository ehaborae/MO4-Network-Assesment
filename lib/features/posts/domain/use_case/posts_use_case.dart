import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_case_base.dart';
import '../entity/post.dart';
import '../repository_base/post_repository_base.dart';

class PostsUseCase extends UseCaseBase<List<Post>> {
  final PostsRepositoryBase repository;

  PostsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getPosts();
  }
}
