import 'package:flutter/foundation.dart';

class AddMedic {
  int ID;
  String DESIGN;
  String LABO;
  String FAMILLE;
  

  AddMedic({
    @required this.DESIGN, 
    @required this.LABO,
    @required this.ID,
    @required this.FAMILLE,
    });

  Map<String,dynamic> toJson(){
    return{
      "DESIGN":DESIGN,
      "LABO":LABO,
      "ID" : ID,
      "FAMILLE" : FAMILLE,
    };

  }
}