class Ordan {
  String Indication;
  String SujetNormal;
  String idpatient;
  String consultid;

  Ordan({this.Indication, this.SujetNormal, this.idpatient, this.consultid});

  factory Ordan.formJson(Map<String, dynamic> json) {
    return new Ordan(
      consultid: json['consultid'],
      Indication: json['Indication'],
      SujetNormal: json['SujetNormal'],
      idpatient: json['idpatient'],
    );
  }
}
