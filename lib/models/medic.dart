import 'dart:ffi';

import 'package:flutter/material.dart';

class Medic with ChangeNotifier   {
  String DESIGN;
  String LABO;
  

  Medic({this.DESIGN,this.LABO});

  factory Medic.formJson(Map <String, dynamic> json){
    return new Medic(
       DESIGN: json['DESIGN'],
       LABO: json['LABO'],
       //PRIX_REF:json['PRIX_REF'],
    );
  }
}