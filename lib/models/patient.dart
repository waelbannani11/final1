class Patient {
  int idpatient;
  String nom;
  String prenom;
  String sex;
  String profession;
  String rue;
  String nationnalite;
  String ville;
  int statusmatriomo_id ;
  String tel_mobile ;
  String numfiche;
  String code_Year;
  
  
  

  Patient({this.idpatient,this.nom, this.prenom,this.sex, this.profession,this.rue,this.nationnalite,this.ville,this.statusmatriomo_id,this.tel_mobile,this.numfiche ,this.code_Year});

  factory Patient.formJson(Map <String, dynamic> json){
    return new Patient(
      idpatient: json['idpatient'],
       nom: json['nom'],
       prenom: json['prenom'],
       sex: json['sex'],
       profession: json['profession'],
       rue: json['rue'],
       nationnalite: json['nationnalite'],
       ville: json['ville'],
       statusmatriomo_id: json['statusmatriomo_id'],
       tel_mobile: json['tel_mobile'],
       numfiche: json['numfiche'],
       code_Year: json['code_Year'],
    );
  }
}




