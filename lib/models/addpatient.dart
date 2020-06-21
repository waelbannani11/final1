import 'package:flutter/foundation.dart';

class AddPatient {
  int patientid;
  String nom;
  String prenom;
  String sex;
  int statusmatriomo_id;

  AddPatient({
    @required this.patientid,
    @required this.nom, 
    @required this.prenom,
    @required this.sex,
    @required this.statusmatriomo_id});

  Map<String,dynamic> toJson(){
    return{
      "patientid":patientid,
      "nom":nom,
      "prenom":prenom,
      "sex":sex,
      "statusmatriomo_id":statusmatriomo_id,
    };

  }
}