import 'package:final1/models/addOrdonnance.dart';
import 'package:final1/models/addpatient.dart';
import 'package:final1/models/ordonnance_service.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/calendar_page.dart';
import 'package:final1/screens/patient_screens/patient_info.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/models/patient.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class Ordonnance extends StatefulWidget {
  int id;
  String consultid;

  Ordonnance({this.id, this.consultid});
  @override
  _OrdonnanceState createState() => _OrdonnanceState(
        id,
        consultid,
      );
}

class _OrdonnanceState extends State<Ordonnance> {
  int id;
  String consultid;

  _OrdonnanceState(this.id, this.consultid);
  OrdonnanceService get ordonnanceService => GetIt.I<OrdonnanceService>();
  TextEditingController _indication1Controller = TextEditingController();
  TextEditingController _ordonnance1Controller = TextEditingController();
  TextEditingController _indication2Controller = TextEditingController();
  TextEditingController _ordonnance2Controller = TextEditingController();
  TextEditingController _indication3Controller = TextEditingController();
  TextEditingController _ordonnance3Controller = TextEditingController();
  TextEditingController _consultidController = TextEditingController();
  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _idConttoller.text = id.toString();
    _consultidController.text = consultid;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    //consultid
    Widget buildconsultid() {
      return TextFormField(
        controller: _consultidController,
        enabled: false,
        decoration: InputDecoration(
            labelText: 'consultid id',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'consultid is Required';
          }

          return null;
        },
      );
    }

    //id
    Widget buildid() {
      return TextFormField(
        controller: _idConttoller,
        enabled: false,
        decoration: InputDecoration(
            labelText: 'patient id',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'id is Required';
          }

          return null;
        },
      );
    }

    //Ordonnance
    Widget _buildOrdonnance1() {
      return TextFormField(
        controller: _ordonnance1Controller,
        decoration: InputDecoration(
            labelText: 'Medicament',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Medicament is Required';
          }
          return null;
        },
      );
    }

    //Indication
    Widget _buildIndication1() {
      return TextFormField(
        controller: _indication1Controller,
        decoration: InputDecoration(
            labelText: 'Indication',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Indication is Required';
          }
          return null;
        },
      );
    }

    //Ordonnance
    Widget _buildOrdonnance2() {
      return TextFormField(
        controller: _ordonnance2Controller,
        decoration: InputDecoration(
            labelText: 'Medicament',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //Indication
    Widget _buildIndication2() {
      return TextFormField(
        controller: _indication2Controller,
        decoration: InputDecoration(
            labelText: 'Indication',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //Ordonnance
    Widget _buildOrdonnance3() {
      return TextFormField(
        controller: _ordonnance3Controller,
        decoration: InputDecoration(
            labelText: 'Medicament',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //Indication
    Widget _buildIndication3() {
      return TextFormField(
        controller: _indication3Controller,
        decoration: InputDecoration(
            labelText: 'Indication',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //Age
    Widget _buildAge() {
      return TextFormField(
        controller: _ageController,
        decoration: InputDecoration(
            labelText: 'Age',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || !isNumeric(value)) {
            return 'Age is Required';
          }
          return null;
        },
      );
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Ajouter Ordonnance"),
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
                    buildconsultid(),
                    buildid(),
                    _buildOrdonnance1(),
                    _buildIndication1(),
                    _buildOrdonnance2(),
                    _buildIndication2(),
                    _buildOrdonnance3(),
                    _buildIndication3(),
                    _buildAge(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          String a = _ordonnance1Controller.text +
                              "/" +
                              _ordonnance2Controller.text +
                              "/" +
                              _ordonnance3Controller.text;
                          String b = _indication1Controller.text +
                              "/" +
                              _indication2Controller.text +
                              "/" +
                              _indication3Controller.text;
                          final ordonnance = AddOrdonnance(
                            idpatient: _idConttoller.text,
                            Age: _ageController.text,
                            Indication: b,
                            SujetNormal: a,
                            consultid: _consultidController.text,
                          );
                          final result =
                              await ordonnanceService.createOrdan(ordonnance);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Patients()),
                          );
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
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
                                        "Ajouté avec succès",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "Vous pouvez suivre l'historique des patients dans la page historique medicale ",
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
