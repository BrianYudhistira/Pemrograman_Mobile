import 'dart:convert';
import 'package:http/http.dart';
import 'post.dart';

class PostService {
  Future<Posts> fetchPosts(Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
// If the server did return a 200 OK response,
// then parse the JSON.
      return Posts.fromJson(jsonDecode(response.body));
    } else {
// If the server did not return a 200 OK response,
// then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}