import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_page/models/user.dart';

class UserApiClient {
  Future<UserLoginResponse> getLogin(String email, String password) async {
    final response = await http.post(
      Uri.parse('$IP:8081/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print("Loggin worked");
      return UserLoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
