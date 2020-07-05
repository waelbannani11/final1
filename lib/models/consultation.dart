class Consultation {
  String consultid;
  String motif;
  double sv_pressionsyst;
  double sv_pressiondiast;
  double sv_temperature;
  double sv_poids;
  double sv_taille;
  String patientid;
  String subjectif;

  Consultation(
      {this.consultid,
      this.motif,
      this.sv_pressionsyst,
      this.sv_pressiondiast,
      this.sv_temperature,
      this.sv_poids,
      this.sv_taille,
      this.patientid,
      this.subjectif});

  factory Consultation.formJson(Map<String, dynamic> json) {
    return new Consultation(
      consultid: json['consultid'],
      motif: json['motif'],
      sv_pressionsyst: json['sv_pressionsyst'],
      sv_pressiondiast: json['sv_pressiondiast'],
      sv_temperature: json['sv_temperature'],
      sv_poids: json['sv_poids'],
      sv_taille: json['sv_taille'],
      patientid: json['patientid'],
      subjectif: json['subjectif'],
    );
  }
}
