import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:biofresh/api/postAPI/index.dart';
import 'package:biofresh/models/postModel.dart';

class DataProvider with ChangeNotifier {
  String data = 'Initial Data';

  void updateData(msg){
    this.data = msg;
    notifyListeners();
  }
}
