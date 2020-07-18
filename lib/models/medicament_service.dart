import 'dart:convert';

import 'package:http/http.dart' as http;

import 'addmedic.dart';
import 'api_response.dart';
import 'medic.dart';

class MedicamentService {
  static const API = 'http://192.168.100.134:5000';

  Future<APIResponse<List<Medic>>> getMedicamentList() {
    return http.get(API + '/Medicaments').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patients = <Medic>[];
        for (var item in jsonData) {
          patients.add(Medic.formJson(item));
        }
        return APIResponse<List<Medic>>(data: patients);
      }
      return APIResponse<List<Medic>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Medic>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createMedic(AddMedic item) {
    return http.post(
      API + '/Medicament',
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

  Future<APIResponse<bool>> updatemedic(AddMedic item) {
    return http.put(
      API + '/ModifyMedicament',
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

  Future<APIResponse<bool>> deleteMedic(AddMedic item) {
    return http.put(
      API + '/DeleteMedic',
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
