class Loginn {
  String Code;
  String Prenom;

  Loginn({this.Code, this.Prenom});

  factory Loginn.formJson(Map<String, dynamic> json) {
    return new Loginn(
      Code: json['Code'],
      Prenom: json['Prenom'],
    );
  }
}
