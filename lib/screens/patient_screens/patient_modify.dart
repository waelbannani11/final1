import 'package:final1/models/addpatient.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/calendar_page.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:final1/theme/colors/light_colors.dart';
import 'package:final1/widgets/back_button.dart';
import 'package:final1/models/patient.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:string_validator/string_validator.dart';

class PatientModify extends StatefulWidget {
  int id;
  String nom;
  String prenom;
  String profession;
  String rue;
  String nationnalite;
  String ville;
  String tel_mobile;
  String code_Year;
  PatientModify({
    this.id,
    this.nom,
    this.prenom,
    this.profession,
    this.rue,
    this.nationnalite,
    this.ville,
    this.tel_mobile,
    this.code_Year,
  });
  @override
  _PatientModifyState createState() => _PatientModifyState(
        id,
        nom,
        prenom,
        profession,
        rue,
        nationnalite,
        ville,
        tel_mobile,
        code_Year,
      );
}

class _PatientModifyState extends State<PatientModify> {
  int id;
  String nom;
  String prenom;
  String profession;
  String rue;
  String nationnalite;
  String ville;
  String tel_mobile;
  String code_Year;
  _PatientModifyState(
    this.id,
    this.nom,
    this.prenom,
    this.profession,
    this.rue,
    this.nationnalite,
    this.ville,
    this.tel_mobile,
    this.code_Year,
  );

  String groupValue = 'M';
  int groupValue1 = 1;

  void handleRadioValueChanged(String value) {
    setState(() {
      this.groupValue = value;
    });
  }

  void handleRadioValueChangedd(int value) {
    setState(() {
      this.groupValue1 = value;
    });
  }

  PatientService get patientService => GetIt.I<PatientService>();

  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _nomConttoller = TextEditingController();
  TextEditingController _prenomConttoller = TextEditingController();
  TextEditingController _sexConttoller = TextEditingController();
  TextEditingController _professionConttoller = TextEditingController();
  TextEditingController _rueConttoller = TextEditingController();
  TextEditingController _nationnaliteConttoller = TextEditingController();
  TextEditingController _statusmatriomo_idConttoller = TextEditingController();
  TextEditingController _tel_mobileConttoller = TextEditingController();
  TextEditingController _villeConttoller = TextEditingController();
  TextEditingController _codeYearConttoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _codeYearConttoller.text = code_Year;
    _nomConttoller.text = nom;
    _prenomConttoller.text = prenom;
    _professionConttoller.text = profession;
    _villeConttoller.text = ville;
    _nationnaliteConttoller.text = nationnalite;
    _rueConttoller.text = rue;
    _tel_mobileConttoller.text = tel_mobile;
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    //nom
    Widget _buildnom() {
      return TextFormField(
        controller: _nomConttoller,
        decoration: InputDecoration(
            labelText: 'nom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || (isNumeric(value))) {
            return 'nom is Required';
          }
          return null;
        },
      );
    }

    //prenom
    Widget _buildprenom() {
      return TextFormField(
        controller: _prenomConttoller,
        decoration: InputDecoration(
            labelText: 'prenom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || (isNumeric(value))) {
            return 'prenom is Required';
          }
          return null;
        },
      );
    }

    //id
    Widget _buildid() {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextFormField(
          controller: _codeYearConttoller,
          decoration: InputDecoration(
              labelText: 'Code Year',
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  borderSide: new BorderSide())),
          maxLength: 20,
          validator: (String value) {
            if ((value.isEmpty) || !(isNumeric(value))) {
              return 'Code Year';
            }
            return null;
          },
        ),
      );
    }

    //deb

    Widget _builddatenai() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de naissance',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
      );
    }

    //nation
    Widget _buildnationn() {
      return TextFormField(
        controller: _nationnaliteConttoller,
        decoration: InputDecoration(
            labelText: 'nationnalite',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || (isNumeric(value))) {
            return 'nationnalite is Required';
          }
          return null;
        },
      );
    }

    //profession
    Widget _buildprofession() {
      return TextFormField(
        controller: _professionConttoller,
        decoration: InputDecoration(
            labelText: 'profession',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if ((value.isEmpty) || (isNumeric(value))) {
            return 'profession is Required';
          }
          return null;
        },
      );
    }

    //    //telmob
    Widget _buildtelmob() {
      return TextFormField(
        controller: _tel_mobileConttoller,
        decoration: InputDecoration(
            labelText: 'tel mob',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 11,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if ((value.isEmpty) || !(isNumeric(value))) {
            return 'telmob is Required';
          }
          return null;
        },
      );
    }

    //rue
    Widget _buildrue() {
      return TextFormField(
        controller: _rueConttoller,
        decoration: InputDecoration(
            labelText: 'rue',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        maxLines: 2,
        validator: (String value) {
          if (value.isEmpty) {
            return 'rue is Required';
          }
          return null;
        },
      );
    }

    //ville
    Widget _buildville() {
      return TextFormField(
        controller: _villeConttoller,
        decoration: InputDecoration(
            labelText: 'ville',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'ville is Required';
          }
          return null;
        },
      );
    }

    //gendre
    Widget _gendre(String groupValue, handleRadioValueChanged) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'SEXE',
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Radio<String>(
                  value: "M",
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged,
                ),
                Text("Male"),
                Radio<String>(
                  value: "F",
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged,
                ),
                Text("Female"),
              ],
            )
          ]);
    }

    //gendre
    Widget _etatcivil(int groupValue1, handleRadioValueChangedd) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Etat civil',
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Célibataire"),
                    Radio<int>(
                      value: 2,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Marié(e)"),
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 3,
                      groupValue: groupValue1,
                      onChanged: handleRadioValueChangedd,
                    ),
                    Text("Divorcé(e)"),
                  ],
                )
              ],
            )
          ]);
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Modifier Patient "),
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
                    _buildnom(),
                    _buildprenom(),
                    //_builddatenai(),
                    _buildid(),
                    _gendre(groupValue, handleRadioValueChanged),
                    _etatcivil(groupValue1, handleRadioValueChangedd),
                    _buildnationn(),
                    _buildprofession(),
                    _buildtelmob(),
                    _buildville(),
                    _buildrue(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final patient = AddPatient(
                            patientid: id,
                            code_Year: _codeYearConttoller.text,
                            nom: _nomConttoller.text,
                            prenom: _prenomConttoller.text,
                            sex: groupValue,
                            statusmatriomo_id: groupValue1,
                            profession: _professionConttoller.text,
                            rue: _rueConttoller.text,
                            nationnalite: _nationnaliteConttoller.text,
                            ville: _villeConttoller.text,
                            tel_mobile: _tel_mobileConttoller.text,
                          );
                          final result =
                              await patientService.updatePatient(patient);
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
                                        "Modifié avec succès",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "Vous pouvez suivre le nouveau patient dans la page des pateints ",
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
