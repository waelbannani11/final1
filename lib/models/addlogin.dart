import 'package:flutter/foundation.dart';

class AddLogin {
  String Code;
  String Prenom;

  AddLogin({
    @required this.Code,
    @required this.Prenom,
  });

  Map<String, dynamic> toJson() {
    return {
      "Code": Code,
      "Prenom": Prenom,
    };
  }
}
