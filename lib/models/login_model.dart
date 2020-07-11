class Loginn {
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

  Loginn(
      {this.Code,
      this.Prenom,
      this.Nom,
      this.Adresse,
      this.Specialite,
      this.Ville,
      this.CodeP,
      this.TelBur1,
      this.TelBur2,
      this.TelDom,
      this.Gsm,
      this.Email,
      this.Fax});

  factory Loginn.formJson(Map<String, dynamic> json) {
    return new Loginn(
      Code: json['Code'],
      Prenom: json['Prenom'],
      Nom: json['Nom'],
      Adresse: json['Adresse'],
      Specialite: json['Specialite'],
      Ville: json['Ville'],
      CodeP: json['CodeP'],
      TelBur1: json['TelBur1'],
      TelBur2: json['TelBur2'],
      TelDom: json['TelDom'],
      Gsm: json['Gsm'],
      Email: json['Email'],
      Fax: json['Fax'],
    );
  }
}
