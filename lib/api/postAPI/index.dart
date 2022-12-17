import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:biofresh/models/postModel.dart';

Future<List<Post>> fetchPostData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    return Future.value(
      body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList(),
    );
  } else {
    throw Exception('Failed to load posts');
  }
}
