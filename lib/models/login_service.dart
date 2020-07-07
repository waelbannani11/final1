import 'dart:convert';
import 'package:final1/models/addlogin.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class LoginService {
  static const API = 'http://10.0.3.2:5000';

  Future<APIResponse<bool>> verifierlogin(AddLogin item) {
    return http.post(
      API + '/Login',
      body: json.encode(item.toJson()),
      headers: {"Content-Type": "application/json"},
    ).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
