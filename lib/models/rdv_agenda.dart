import 'package:flutter/foundation.dart';

class AddRdv {
  String subject;
  String startTime;
  String endTime;
  String patientid;
  int typerdvid;
  int rdvid;

  AddRdv({
    @required this.subject,
    @required this.startTime,
    @required this.endTime,
    @required this.patientid,
    @required this.typerdvid,
    @required this.rdvid,
  });

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "startTime": startTime,
      "endTime": endTime,
      "patientid": patientid,
      "typerdvid": typerdvid,
      "rdvid": rdvid,
    };
  }
}
