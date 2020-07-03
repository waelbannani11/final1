import 'dart:ffi';
import 'package:flutter/material.dart';

class Medic with ChangeNotifier   {
  
  int ID;
  String DESIGN;
  String LABO;
  Float PRIX_REF;
  String FAMILLE;
  

  Medic({this.ID,this.DESIGN,this.LABO,this.PRIX_REF,this.FAMILLE});

  factory Medic.formJson(Map <String, dynamic> json){
    return new Medic(
       ID: json['ID'],
       DESIGN: json['DESIGN'],
       LABO: json['LABO'],
       PRIX_REF:json['MONT_REMB'] as Float ,
       FAMILLE:json['FAMILLE']  ,
    );
  }
}