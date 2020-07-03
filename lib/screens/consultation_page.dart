import 'package:final1/models/addconsultation.dart';
import 'package:final1/models/consultation.service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/widgets/my_text_field.dart';
import 'package:final1/screens/home_page.dart';
import 'search.dart';
import 'package:final1/models/patient.dart';
import 'calendar_page.dart';
import 'package:final1/models/rdv.dart';

class Consultation extends StatefulWidget {
  int id;

  Consultation({
    this.id,
  });
  @override
  _ConsultationState createState() => _ConsultationState(
        id,
      );
}

class _ConsultationState extends State<Consultation> {
  int id;

  _ConsultationState(
    this.id,
  );

  ConsultationService get consultationService => GetIt.I<ConsultationService>();
  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _motifController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _idConttoller.text = id.toString();
    final _formKey = GlobalKey<FormState>();
    final Post post = ModalRoute.of(context).settings.arguments;
    double width = MediaQuery.of(context).size.width;

    //nom
    Widget _buildrdvid() {
      return TextFormField(
        // initialValue: post.title,
        decoration: InputDecoration(
            labelText: 'rdvid',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
      );
    }

    //prenom
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
            return 'lastname is Required';
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

    //num_fiche
    Widget buildnumfiche() {
      return TextFormField(
        //initialValue: '$post.title /20',
        decoration: InputDecoration(
            labelText: 'Num_fiche',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 30,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Num_fiche is Required';
          }

          return null;
        },
      );
    }
    //deb

    Widget builddatedeb() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de consultation',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'date is Required';
          }

          return null;
        },
      );
    }

    //fin
    Widget builddatefin() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de fin',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'datefin is Required';
          }

          return null;
        },
      );
    }

    //pressionsyst
    Widget buildpressionsyst() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'pressionsyst',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'pressionsyst is Required';
          }
          return null;
        },
      );
    }

    //pressiondiast
    Widget buildpressiondiast() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'pressiondiast',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'pressiondiast is Required';
          }
          return null;
        },
      );
    }

    //temperature
    Widget buildtemperature() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'temperature',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'temperature is Required';
          }
          return null;
        },
      );
    }

    Widget buildpoids() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'poids',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'poids is Required';
          }
          return null;
        },
        onSaved: (String value) {
          //rdv.type = value;
        },
      );
    }

    Widget buildtaille() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'taille',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'taille is Required';
          }
          return null;
        },
        onSaved: (String value) {
          //rdv.type = value;
        },
      );
    }

    Widget buildrdvid() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'rdvid',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'rdvid is Required';
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
                    buildid(),
                    _buildmotif(),
                    builddatedeb(),
                    buildpressionsyst(),
                    buildpressiondiast(),
                    buildtemperature(),
                    buildpoids(),
                    buildtaille(),
                    GestureDetector(
                      onTap: () async {
                        print(_motifController.text);
                        final consult = AddConsultation(
                          motif: _motifController.text,
                        );
                        final result =
                            await consultationService.createConcult(consult);
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
