import 'dart:ffi';
import 'package:flutter/foundation.dart';

class AddConsultation {
  String consultid;
  String motif;
  double sv_pressionsyst;
  double sv_pressiondiast;
  double sv_temperature;
  double sv_poids;
  double sv_taille;
  String patientid;
  String subjectif;

  AddConsultation({
    @required this.consultid,
    @required this.motif,
    @required this.sv_pressionsyst,
    @required this.sv_pressiondiast,
    @required this.sv_temperature,
    @required this.sv_poids,
    @required this.sv_taille,
    @required this.patientid,
    @required this.subjectif,
  });

  Map<String, dynamic> toJson() {
    return {
      "consultid": consultid,
      "motif": motif,
      "sv_pressionsyst": sv_pressionsyst,
      "sv_pressiondiast": sv_pressiondiast,
      "sv_temperature": sv_temperature,
      "sv_poids": sv_poids,
      "sv_taille": sv_taille,
      "patientid": patientid,
      "subjectif": subjectif,
    };
  }
}
