import 'package:dio/dio.dart';
import 'package:provider_demo/features/posts/data/model/comment_model.dart';

import '/core/remote/error_model.dart';
import '/core/error/remote_exception.dart';
import '/core/remote/remote_constants.dart';
import '../model/post_model.dart';

abstract class PostsRemoteDatasourceBase {
  Future<List<PostModel>> getPosts();

  Future<PostModel> getPost(int postId);

  Future<List<CommentModel>> getComments(int postId);

  Future<void> deletePost(int postId);
}

class PostRemoteDatasource extends PostsRemoteDatasourceBase {
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await Dio().get(RemoteConstants.postsPath);
      final result = response.data as List;
      return result.map((e) => PostModel.fromJson(e)).toList();
    } on DioException catch (exception) {
      throw RemoteException(
          errorModel: RemoteErrorModel.fromJson(exception.response!.data));
    }
  }

  @override
  Future<PostModel> getPost(int postId) async {
    try {
      final response = await Dio().get('${RemoteConstants.postPath}/$postId');
      final result = response.data;
      return PostModel.fromJson(result);
    } on DioException catch (exception) {
      throw RemoteException(
          errorModel: RemoteErrorModel.fromJson(exception.response!.data));
    }
  }

  @override
  Future<List<CommentModel>> getComments(int postId) async {
    try {
      final path =
          RemoteConstants.commentsPath.replaceAll(' ', postId.toString());
      final response = await Dio().get(path);
      final result = response.data as List;
      return result.map((e) => CommentModel.fromJson(e)).toList();
    } on DioException catch (exception) {
      throw RemoteException(
          errorModel: RemoteErrorModel.fromJson(exception.response!.data));
    }
  }

  @override
  Future<void> deletePost(int postId) async {
    try {
      await Dio().get('${RemoteConstants.deletePostPath}/$postId');
    } on DioException catch (exception) {
      throw RemoteException(
          errorModel: RemoteErrorModel.fromJson(exception.response!.data));
    }
  }
}
