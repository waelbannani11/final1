import 'package:final1/models/rdv_agenda.dart';
import 'package:final1/models/rdv_service.dart';
import 'package:final1/screens/datedialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

class DeleteRDV extends StatefulWidget {
  @override
  _DeleteRDVState createState() => _DeleteRDVState();
}

class _DeleteRDVState extends State<DeleteRDV> {
  RDVSERVICE get rdvservice => GetIt.I<RDVSERVICE>();
  TextEditingController _rdvidConttoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget buildrdvid() {
      return TextFormField(
        controller: _rdvidConttoller,
        decoration: InputDecoration(
            labelText: 'RDV ID',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'RDV ID is Required';
          }

          return null;
        },
      );
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Supprimer RDV"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    buildrdvid(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final rdv = AddRdv(
                            rdvid: int.parse(_rdvidConttoller.text),
                          );
                          final result = await rdvservice.deleterdv(rdv);
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 96,
                                      color: Color(0xFF10CA88),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "Supprimé avec succès",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "Vous pouvez suivre le rdv patient dans la page des rdvs ",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 80,
                        width: width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'valider',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                              width: width / 1.3,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
