import 'dart:convert';
import 'package:final1/models/addpatient.dart';
import 'package:final1/models/patient.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class PatientService {
  static const API = 'http://192.168.43.193:5000';

  Future<APIResponse<List<Patient>>> getPatientList() {
    return http.get(API + '/Patients').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patients = <Patient>[];
        for (var item in jsonData) {
          patients.add(Patient.formJson(item));
        }
        return APIResponse<List<Patient>>(data: patients);
      }
      return APIResponse<List<Patient>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<Patient>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createPatient(AddPatient item) {
    return http.post(
      API + '/Patient',
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

  Future<APIResponse<bool>> updatePatient(AddPatient item) {
    return http.put(
      API + '/ModifyPatient',
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

  Future<APIResponse<bool>> deletePatient(AddPatient item) {
    return http.put(
      API + '/Delete',
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
