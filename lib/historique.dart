import 'dart:convert';
import 'package:final1/screens/medicament_screens/create_new_medicament.dart';
import 'package:final1/screens/medicament_screens/medicaments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'models/consultation.dart';

class HistoriqueMed extends StatefulWidget {
  int id;
  String nom;
  String prenom;
  HistoriqueMed({this.id, this.nom, this.prenom});
  @override
  _HistoriqueMedState createState() => _HistoriqueMedState(
        id,
        nom,
        prenom,
      );
}

class _HistoriqueMedState extends State<HistoriqueMed> {
  int id;
  String nom;
  String prenom;
  _HistoriqueMedState(this.id, this.nom, this.prenom);
  List<Consultation> _list = [];
  List<Consultation> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/Consultations';
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
          _list.add(Consultation.formJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les Consultations")),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _list.length,
        itemBuilder: (context, i) {
          final a = _list[i];
          return Container(
            child: a.patientid == id.toString()
                ? Table(
                    border: TableBorder(
                        left: BorderSide.none,
                        right: BorderSide.none,
                        top: BorderSide.none,
                        bottom: BorderSide(width: 0.5)),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 1, child: Text(a.consultid)),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 4, child: Text(a.patientid)),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(flex: 1, child: Text(nom)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
          );
        },
      ),
    );
  }
}
