import 'package:flutter/foundation.dart';

class AddRdv {
  String subject;
  String startTime;
  String endTime;
  String patientid;
  int typerdvid;

  AddRdv({
    @required this.subject,
    @required this.startTime,
    @required this.endTime,
    @required this.patientid,
    @required this.typerdvid,
  });

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "startTime": startTime,
      "endTime": endTime,
      "patientid": patientid,
      "typerdvid": typerdvid,
    };
  }
}
