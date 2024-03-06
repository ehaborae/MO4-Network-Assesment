import 'package:dartz/dartz.dart';
import 'package:provider_demo/features/posts/domain/entity/comment.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/remote_exception.dart';
import '../../domain/entity/post.dart';
import '../../domain/repository_base/post_repository_base.dart';
import '../datasource/post_datasource.dart';

class PostsRepository extends PostsRepositoryBase {
  final PostsRemoteDatasourceBase remoteDatasource;

  PostsRepository({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final response = await remoteDatasource.getPosts();
      return Right(response);
    } on RemoteException catch (exception) {
      return Left(RemoteFailure(
        message: exception.errorModel.statusMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, Post>> getPost(int postId) async {
    try {
      final response = await remoteDatasource.getPost(postId);
      return Right(response);
    } on RemoteException catch (exception) {
      return Left(RemoteFailure(
        message: exception.errorModel.statusMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int postId) async {
    try {
      final response = await remoteDatasource.getComments(postId);
      return Right(response);
    } on RemoteException catch (exception) {
      return Left(RemoteFailure(
        message: exception.errorModel.statusMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> deletePost(int postId) async {
    try {
      final response = await remoteDatasource.deletePost(postId);
      return Right(response);
    } on RemoteException catch (exception) {
      return Left(RemoteFailure(
        message: exception.errorModel.statusMessage,
      ));
    }
  }
}
