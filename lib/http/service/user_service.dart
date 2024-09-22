import 'dart:convert';

import 'package:flutter_http/http/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'https://reqres.in/api';
  static Future<List<User>> fetchUser() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=2'));
      final result = jsonDecode(response.body);
      List<User> users = List<User>.from(
        result['data'].map(
          (user) => User.fromJson(user),
        ),
      );
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
