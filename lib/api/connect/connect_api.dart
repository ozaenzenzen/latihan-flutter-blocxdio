import 'package:dio/dio.dart';
import 'package:flutter_bloc_lat4/api/model/post.dart';

class ConnectAPI {
  final dio = Dio();

  // static Future<List<Post>> getPost(int start, int limit) async {
  static getPost(int start, int limit) async {
    String url = "https://jsonplaceholder.typicode.com/posts?_start=" +
        start.toString() +
        "&_limit=" +
        limit.toString();

    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      var jsonObject = await response.data;
      return jsonObject;
    } else {
      throw ("Data tidak ditemukan");
    }
  }
}
