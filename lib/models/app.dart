class App {
  String subject;
  String startTime;
  String endTime;
  bool allDay;

  App(this.allDay, this.endTime, this.startTime, this.subject);

  App.fromJson(Map<String, dynamic> json) {
    subject = json['Subject'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    allDay = json['AllDay'];
  }
}
