import 'package:flutter/cupertino.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entity/post.dart';
import '../../domain/repository_base/post_repository_base.dart';
import '../../domain/use_case/posts_use_case.dart';

class PostsProvider extends ChangeNotifier {
  PostsProvider({required this.repository});

  final PostsRepositoryBase repository;
  CallStatus callStatus = CallStatus.loaded;
  String? message;
  List<Post>? posts;

  Future<void> getPosts() async {
    callStatus = CallStatus.loading;
    notifyListeners();
    final result = await PostsUseCase(repository: repository)();
    result.fold(
      (failure) {
        callStatus = CallStatus.error;
        message = failure.message;
        notifyListeners();
      },
      (data) {
        callStatus = CallStatus.loaded;
        posts = data;
        notifyListeners();
      },
    );
  }
}
