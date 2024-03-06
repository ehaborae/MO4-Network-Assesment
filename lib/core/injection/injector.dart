import 'package:get_it/get_it.dart';

import '/features/posts/data/datasource/post_datasource.dart';
import '/features/posts/domain/repository_base/post_repository_base.dart';
import '/features/posts/data/repository/post_repository.dart';

final injector = GetIt.instance;

class Injector {
  static void init() {
    /// Repository.
    injector.registerLazySingleton<PostsRepositoryBase>(
        () => PostsRepository(remoteDatasource: injector()));

    /// Data Sources.
    injector.registerLazySingleton<PostsRemoteDatasourceBase>(
        () => PostRemoteDatasource());
  }
}
