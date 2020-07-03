import 'package:flutter/foundation.dart';

class AddPatient {
  int patientid; 
  String nom ; 
  String prenom ; 
  String sex;
  String profession;
  String rue;
  String nationnalite;
  String ville;
  int statusmatriomo_id ;
  String tel_mobile ;

  AddPatient({
    @required this.patientid,
    @required this.nom, 
    @required this.prenom,
    @required this.sex,
    @required this.profession,
    @required this.rue,
    @required this.nationnalite,
    @required this.ville,
    @required this.statusmatriomo_id,
    @required this.tel_mobile,
    });


  Map<String,dynamic> toJson(){
    return{
      "patientid":patientid,
      "nom":nom,
      "prenom":prenom,
      "sex":sex,
      "statusmatriomo_id":statusmatriomo_id,
      "profession":profession,
      "rue":rue,
      "nationnalite":nationnalite,
      "ville":statusmatriomo_id,
      "tel_mobile":tel_mobile,
    };

  }
}