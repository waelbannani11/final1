class Patient {
  int idpatient;
  String nom;
  String prenom;
  String sex;
  int statusmatriomo_id;
  DateTime birthday;

  Patient({this.idpatient,this.nom, this.prenom,this.sex,this.statusmatriomo_id,this.birthday});

  factory Patient.formJson(Map <String, dynamic> json){
    return new Patient(
      idpatient: json['idpatient'],
       nom: json['nom'],
       prenom: json['prenom'],
       sex: json['sex'],
       statusmatriomo_id: json['statusmatriomo_id'],
       birthday: json['birthday'],
    );
  }
}




