import 'dart:convert';
import 'package:final1/models/patient.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class PatientService {
  static const API = 'http://10.0.3.2:5000';

  Future<APIResponse<List<Patient>>> getPatientList() {
    return http.get(API+'/Patients').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patients = <Patient>[];
        for (var item in jsonData) {
          patients.add(Patient.formJson(item));
        }
        return APIResponse<List<Patient>>(data: patients);
      }
      return APIResponse<List<Patient>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<Patient>>(error: true, errorMessage: 'An error occured'));
  }

    Future<APIResponse<List<Patient>>> getPatientListid(String idpatient) {
    return http.get(API+'/Patients').then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final patients = <Patient>[];
        for (var item in jsonData) {
          patients.add(Patient.formJson(item));
        }
        return APIResponse<List<Patient>>(data: patients);
      }
      return APIResponse<List<Patient>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<Patient>>(error: true, errorMessage: 'An error occured'));
  }
}