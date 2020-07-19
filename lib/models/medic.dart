import 'package:flutter/material.dart';

class Medic with ChangeNotifier {
  int ID;
  String DESIGN;
  String LABO;
  String FAMILLE;

  Medic({this.ID, this.DESIGN, this.LABO, this.FAMILLE});

  factory Medic.formJson(Map<String, dynamic> json) {
    return new Medic(
      ID: json['ID'],
      DESIGN: json['DESIGN'],
      LABO: json['LABO'],
      FAMILLE: json['FAMILLE'],
    );
  }
}
