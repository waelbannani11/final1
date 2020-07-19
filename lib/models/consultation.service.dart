import 'dart:convert';
import 'package:final1/models/addconsultation.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class ConsultationService {
  static const API = 'http://192.168.100.134:5000';

  Future<APIResponse<bool>> createConcult(AddConsultation item) {
    return http.post(
      API + '/Consultation',
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
