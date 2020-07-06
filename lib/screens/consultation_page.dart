import 'dart:ffi';

import 'package:final1/models/addconsultation.dart';
import 'package:final1/models/consultation.service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/widgets/my_text_field.dart';
import 'package:final1/screens/home_page.dart';
import 'package:string_validator/string_validator.dart';
import '../historique.dart';
import 'search.dart';
import 'package:final1/models/patient.dart';
import 'calendar_page.dart';
import 'package:final1/models/rdv.dart';

class Consultation extends StatefulWidget {
  int id;
  String nom;
  String prenom;

  Consultation({this.id, this.nom, this.prenom});
  @override
  _ConsultationState createState() => _ConsultationState(
        id,
        nom,
        prenom,
      );
}

class _ConsultationState extends State<Consultation> {
  int id;
  String nom;
  String prenom;

  _ConsultationState(this.id, this.nom, this.prenom);

  ConsultationService get consultationService => GetIt.I<ConsultationService>();
  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _motifController = TextEditingController();
  TextEditingController _pressionsysController = TextEditingController();
  TextEditingController _pressiondiastController = TextEditingController();
  TextEditingController _temperatureController = TextEditingController();
  TextEditingController _poidsController = TextEditingController();
  TextEditingController _tailleController = TextEditingController();
  TextEditingController _subjectifController = TextEditingController();
  TextEditingController _consultidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _idConttoller.text = id.toString();
    final _formKey = GlobalKey<FormState>();
    final Post post = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;

    //motif
    Widget _buildmotif() {
      return TextFormField(
        controller: _motifController,
        decoration: InputDecoration(
            labelText: 'motif',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'motif is Required';
          }

          return null;
        },
      );
    }

    //consultid
    Widget buildconsultid() {
      return TextFormField(
        controller: _consultidController,
        decoration: InputDecoration(
            labelText: 'Consult id',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Consult id is Required';
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

    //pressionsyst
    Widget buildpressionsyst() {
      return TextFormField(
        controller: _pressionsysController,
        decoration: InputDecoration(
            labelText: 'pressionsyst',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'pressionsyst is Required';
          }
          return null;
        },
      );
    }

    //pressiondiast
    Widget buildpressiondiast() {
      return TextFormField(
        controller: _pressiondiastController,
        decoration: InputDecoration(
            labelText: 'pressiondiast',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'pressiondiast is Required';
          }
          return null;
        },
      );
    }

    //temperature
    Widget buildtemperature() {
      return TextFormField(
        controller: _temperatureController,
        decoration: InputDecoration(
            labelText: 'temperature',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'temperature is Required';
          }
          return null;
        },
      );
    }

    Widget buildpoids() {
      return TextFormField(
        controller: _poidsController,
        decoration: InputDecoration(
            labelText: 'poids',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'poids is Required';
          }
          return null;
        },
      );
    }

    Widget buildtaille() {
      return TextFormField(
        controller: _tailleController,
        decoration: InputDecoration(
            labelText: 'taille',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'taille is Required';
          }
          return null;
        },
      );
    }

    Widget buildsubjectif() {
      return TextFormField(
        controller: _subjectifController,
        decoration: InputDecoration(
            labelText: 'subjectif',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 100,
        maxLines: 2,
        validator: (String value) {
          if (value.isEmpty) {
            return 'taille is Required';
          }
          return null;
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Consultation"),
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
                    buildconsultid(),
                    buildid(),
                    _buildmotif(),
                    buildpressionsyst(),
                    buildpressiondiast(),
                    buildtemperature(),
                    buildpoids(),
                    buildtaille(),
                    buildsubjectif(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final consult = AddConsultation(
                            consultid: _consultidController.text,
                            motif: _motifController.text,
                            patientid: _idConttoller.text,
                            sv_poids: double.parse(_poidsController.text),
                            sv_pressiondiast:
                                double.parse(_pressiondiastController.text),
                            sv_pressionsyst:
                                double.parse(_pressionsysController.text),
                            sv_taille: double.parse(_tailleController.text),
                            sv_temperature:
                                double.parse(_temperatureController.text),
                            subjectif: _subjectifController.text,
                          );
                          final result =
                              await consultationService.createConcult(consult);

                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoriqueMed(
                                      id: id,
                                      nom: nom,
                                      prenom: prenom,
                                    )),
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
