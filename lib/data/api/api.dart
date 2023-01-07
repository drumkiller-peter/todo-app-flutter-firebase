class Api {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String getPost = "/posts";
  static String getPostById(int id) => "/posts/$id";
}
