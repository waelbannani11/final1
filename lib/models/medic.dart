import 'dart:ffi';
import 'package:flutter/material.dart';

class Medic with ChangeNotifier   {
  String DESIGN;
  String LABO;
  int PRIX_REMB;
  

  Medic({this.DESIGN,this.LABO,this.PRIX_REMB});

  factory Medic.formJson(Map <String, dynamic> json){
    return new Medic(
       DESIGN: json['DESIGN'],
       LABO: json['LABO'],
       PRIX_REMB:json['PRIX_REMB'] as int ,
    );
  }
}