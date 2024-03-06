import 'package:dartz/dartz.dart';
import 'package:provider_demo/features/posts/domain/entity/comment.dart';

import '../../../../core/error/failure.dart';
import '../entity/post.dart';

abstract class PostsRepositoryBase {
  Future<Either<Failure, List<Post>>> getPosts();

  Future<Either<Failure, Post>> getPost(int postId);

  Future<Either<Failure, List<Comment>>> getComments(int postId);

  Future<Either<Failure, void>> deletePost(int postId);
}
