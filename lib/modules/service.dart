import 'package:http/http.dart' as http;
import 'posts.dart';

class Service {
  static const String url = 'https://jsonplaceholder.typicode.com/comments';
  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Post> posts = postFromJson(response.body);
        return posts;
      } else {
        return <Post>[];
      }
    } catch (e) {
      return <Post>[];
    }
  }
}
