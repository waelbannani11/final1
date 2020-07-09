import 'package:flutter/foundation.dart';

class AddOrdonnance {
  String idpatient;
  String consultid;
  String Age;
  String Indication;
  String SujetNormal;

  AddOrdonnance({
    @required this.idpatient,
    @required this.consultid,
    @required this.Age,
    @required this.Indication,
    @required this.SujetNormal,
  });

  Map<String, dynamic> toJson() {
    return {
      "idpatient": idpatient,
      "Age": Age,
      "Indication": Indication,
      "SujetNormal": SujetNormal,
      "consultid": consultid,
    };
  }
}
