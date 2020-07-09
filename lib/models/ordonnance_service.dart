import 'dart:convert';

import 'package:final1/models/addOrdonnance.dart';
import 'package:http/http.dart' as http;

import 'addmedic.dart';
import 'api_response.dart';

class OrdonnanceService {
  static const API = 'http://10.0.3.2:5000';

  Future<APIResponse<bool>> createOrdan(AddOrdonnance item) {
    return http.post(
      API + '/Ordonnance',
      body: json.encode(item.toJson()),
      headers: {"Content-Type": "application/json"},
    ).then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: 'An error occuredmedicament');
    }).catchError(
        (_) => APIResponse<bool>(error: true, errorMessage: 'An error occure'));
  }
}
