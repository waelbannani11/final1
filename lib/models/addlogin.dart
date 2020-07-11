import 'package:flutter/foundation.dart';

class AddLogin {
  String Code;
  String Prenom;
  String Nom;
  String Adresse;
  String Specialite;
  String Ville;
  String CodeP;
  String TelBur1;
  String TelBur2;
  String TelDom;
  String Gsm;
  String Email;
  String Fax;

  AddLogin({
    @required this.Code,
    @required this.Prenom,
    @required this.Nom,
    @required this.Adresse,
    @required this.Specialite,
    @required this.Ville,
    @required this.CodeP,
    @required this.TelBur1,
    @required this.TelBur2,
    @required this.TelDom,
    @required this.Gsm,
    @required this.Email,
    @required this.Fax,
  });

  Map<String, dynamic> toJson() {
    return {
      "Code": Code,
      "Prenom": Prenom,
      "Nom": Nom,
      "Adresse": Adresse,
      "Specialite": Specialite,
      "Ville": Ville,
      "CodeP": CodeP,
      "TelBur1": TelBur1,
      "TelBur2": TelBur2,
      "TelDom": TelDom,
      "Gsm": Gsm,
      "Email": Email,
      "Fax": Fax,
    };
  }
}
