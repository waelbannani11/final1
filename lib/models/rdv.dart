class Rdv {
  int id;
  String sujet;
  String dateDeb;
  String dateFin;

  String pid;
  String type;

  Rdv({this.id, this.sujet, this.dateDeb, this.dateFin, this.pid, this.type});
  factory Rdv.formJson(Map<String, dynamic> json) {
    return new Rdv(
      id: json['rdvid'],
      sujet: json['sujet'],
      dateDeb: json['date_heuredeb'],
      dateFin: json['date_heurefin'],
      pid: json['patientid'],
      type: json['typerdvid'],
    );
  }
}
