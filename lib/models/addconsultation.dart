import 'dart:ffi';
import 'package:flutter/foundation.dart';

class AddConsultation {
  int consultid;
  String motif;
  int IDpatient;
  Float sv_pressionsyst;
  Float sv_pressiondiast;
  Float sv_temperature;
  Float sv_poids;
  Float sv_taille;

  AddConsultation({
    @required this.consultid,
    @required this.motif,
    @required this.IDpatient,
    @required this.sv_pressionsyst,
    @required this.sv_pressiondiast,
    @required this.sv_temperature,
    @required this.sv_poids,
    @required this.sv_taille,
  });

  Map<String, dynamic> toJson() {
    return {
      "consultid": consultid,
      "motif": motif,
      "IDpatient": IDpatient,
      "sv_pressionsyst": sv_pressionsyst,
      "sv_pressiondiast": sv_pressiondiast,
      "sv_temperature": sv_temperature,
      "sv_poids": sv_poids,
      "sv_taille": sv_taille,
    };
  }
}
