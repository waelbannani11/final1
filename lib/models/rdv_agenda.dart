import 'package:flutter/foundation.dart';

class AddRdv {
  String subject;
  String startTime;
  String endTime;

  AddRdv({
    @required this.subject,
    @required this.startTime,
    @required this.endTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "startTime": startTime,
      "endTime": endTime,
    };
  }
}
