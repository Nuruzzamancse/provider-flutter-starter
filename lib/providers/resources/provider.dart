import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:biofresh/api/postAPI/index.dart';
import 'package:biofresh/models/postModel.dart';

class PostProvider with ChangeNotifier {
  Future<List<Post>> _posts = Future.value([]); // Initialize with an empty list
  Future<List<Post>> get posts => _posts;

  void fetchPosts() async {
    _posts =  fetchPostData();
  }

  void refetchPosts() async {
    _posts =  fetchPostData();
    notifyListeners();
  }
}
