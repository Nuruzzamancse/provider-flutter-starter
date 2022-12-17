import 'package:biofresh/common/helpers.dart';
import 'package:flutter/material.dart';

void calculate(context) async {
    final token = await LoginData().getStoredToken();
    if (token == null) {
      Navigator.pushNamed(context, '/login');
    }
  }