
import 'package:flutter/material.dart';

class Patient with ChangeNotifier   {
  String pid;
  String code;//code annee
  String nom;
  String prenom;
  String sexe;
  String birthday;
  String etatcivil;
  String nationnalite;
  String profession;
  String teldom;
  String telmob;
  String adresse;
  String ville;

   

  Patient({
    this.pid,this.code,this.nom,
    this.prenom,this.sexe,this.birthday,
    this.etatcivil,this.nationnalite,this.profession,
    this.teldom,this.telmob,this.adresse,this.ville
  }
  

  );


  Widget  _buildnom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'nom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
          onSaved: (String value) {
           pid = value;
          }
       
      );
    }



}
