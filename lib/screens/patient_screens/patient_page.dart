import 'dart:convert';
import 'package:final1/models/patient.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/patient_screens/patient_delete.dart';
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
  List<Patient> _list = [];
  List<Patient> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/patien';
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

  PatientService get service => GetIt.I<PatientService>();

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
      appBar: AppBar(
        title: Text("Les Patients"),
      ),
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
                                    backgroundImage: b.sex == 'H'
                                        ? AssetImage('assets/images/boy.png')
                                        : AssetImage('assets/images/girl.png'),
                                  ),
                                  title: Text(b.nom),
                                  trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PatientModify(
                                                  id: b.idpatient,
                                                  nom: b.nom,
                                                  prenom: b.prenom,
                                                )),
                                      );
                                    },
                                  ),
                                  subtitle: Text((b.birthday.toString())),
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
                                                  id: b.idpatient,
                                                  nom: b.nom,
                                                  prenom: b.prenom,
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
                                    //onTap: () => _showSnackBar('Delete'),
                                  ),
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
                                    backgroundImage: a.sex == 'H'
                                        ? AssetImage('assets/images/boy.png')
                                        : AssetImage('assets/images/girl.png'),
                                  ),
                                  title: Text(a.nom),
                                  trailing: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_right),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PatientModify(
                                                  id: a.idpatient,
                                                  nom: a.nom,
                                                  prenom: a.prenom,
                                                )),
                                      );
                                    },
                                  ),
                                  subtitle: Text((a.birthday.toString())),
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
                                    //onTap: () => _showSnackBar('Delete'),
                                  ),
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
