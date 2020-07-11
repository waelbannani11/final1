import 'dart:convert';
import 'package:final1/Animations/BouncyAnimation.dart';
import 'package:final1/models/addpatient.dart';
import 'package:final1/models/api_response.dart';
import 'package:final1/models/patient.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/patient_screens/patient_info.dart';
import 'package:final1/screens/patient_screens/patient_modify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'create_new_patient.dart';

class Patients extends StatefulWidget {
  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  PatientService get patientService => GetIt.I<PatientService>();
  List<Patient> _list = [];
  List<Patient> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/Patients';
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Patient.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.nom.toLowerCase().contains(text) ||
          f.prenom.toLowerCase().contains(text) ||
          f.nom.contains(text) ||
          f.prenom.contains(text)) _search.add(f);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les Patients"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.restore_page),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Patients()),
            );
          },
        ),
      ]),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.blue,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              return Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xffFDCF09),
                                    radius: 20,
                                    //backgroundColor: Colors.transparent,
                                    backgroundImage: b.sex == 'M'
                                        ? AssetImage('assets/images/boy.png')
                                        : AssetImage('assets/images/girl.png'),
                                  ),
                                  title: Text(b.nom),
                                  trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          Bouncy(
                                            widget: PatientInfo(
                                              id: b.idpatient,
                                              nom: b.nom,
                                              prenom: b.prenom,
                                              sex: b.sex,
                                              profession: b.profession,
                                              rue: b.rue,
                                              ville: b.ville,
                                              nationnalite: b.nationnalite,
                                              tel_mobile: b.tel_mobile,
                                              statusmatriomo_id:
                                                  b.statusmatriomo_id,
                                            ),
                                          ));
                                    },
                                  ),
                                  subtitle: Text(b.prenom),
                                ),
                                actions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Modifier',
                                    color: Colors.blue,
                                    icon: Icons.more,
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PatientModify(
                                                  id: b.idpatient,
                                                  nom: b.nom,
                                                  prenom: b.prenom,
                                                  profession: b.profession,
                                                  rue: b.rue,
                                                  ville: b.ville,
                                                  nationnalite: b.nationnalite,
                                                  tel_mobile: b.tel_mobile,
                                                  code_Year: b.code_Year,
                                                )),
                                      );
                                    },
                                  ),
                                ],
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                      caption: 'Supprimer',
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () async {
                                        final patient = AddPatient(
                                          patientid: b.idpatient,
                                        );
                                        final deleteresult = patientService
                                            .deletePatient(patient);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Patients()),
                                        );
                                      }),
                                ],
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Color(0xffFDCF09),
                                    radius: 20,
                                    //backgroundColor: Colors.transparent,
                                    backgroundImage: a.sex == 'M'
                                        ? AssetImage('assets/images/boy.png')
                                        : AssetImage('assets/images/girl.png'),
                                  ),
                                  title: Text(a.nom),
                                  trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          Bouncy(
                                            widget: PatientInfo(
                                              id: a.idpatient,
                                              nom: a.nom,
                                              prenom: a.prenom,
                                              sex: a.sex,
                                              profession: a.profession,
                                              rue: a.rue,
                                              ville: a.ville,
                                              nationnalite: a.nationnalite,
                                              tel_mobile: a.tel_mobile,
                                              statusmatriomo_id:
                                                  a.statusmatriomo_id,
                                            ),
                                          ));
                                    },
                                  ),
                                  subtitle: Text(a.prenom),
                                ),
                                actions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Modifier',
                                    color: Colors.blue,
                                    icon: Icons.more,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PatientModify(
                                                  id: a.idpatient,
                                                  nom: a.nom,
                                                  prenom: a.prenom,
                                                  profession: a.profession,
                                                  rue: a.rue,
                                                  ville: a.ville,
                                                  nationnalite: a.nationnalite,
                                                  tel_mobile: a.tel_mobile,
                                                  code_Year: a.code_Year,
                                                )),
                                      );
                                    },
                                  ),
                                ],
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                      caption: 'Supprimer',
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () async {
                                        final patient = AddPatient(
                                          patientid: a.idpatient,
                                        );
                                        final deleteresult = patientService
                                            .deletePatient(patient);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Patients()),
                                        );
                                      })
                                ],
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Createnvpatient()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
