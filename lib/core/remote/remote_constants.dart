class RemoteConstants {
  /// Base configurations.
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Endpoints
  static const String postsPath = '$baseUrl/posts';
  static const String postPath = '$baseUrl/post'; // add /:id
  static const String commentsPath = '$baseUrl/posts/ /comments'; // add /:id
  static const String deletePostPath = '$baseUrl/posts'; // add /:id
}
