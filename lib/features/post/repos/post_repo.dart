import 'dart:convert';
import 'dart:developer';

import 'package:bloc_study_with_api/features/post/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    List<PostDataUiModel> posts = [];
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPosts() async {
    try {
      var response = await http
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Brocamp",
        "body": "The brother you never had",
        "userId": "1",
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
