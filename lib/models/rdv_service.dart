import 'dart:convert';
import 'package:final1/models/rdv_agenda.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class RDVSERVICE {
  static const API = 'http://192.168.100.200:5000';

  Future<APIResponse<bool>> createRdv(AddRdv item) {
    return http.post(
      API + '/Rdv',
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
