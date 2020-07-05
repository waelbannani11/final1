import 'dart:convert';
import 'package:final1/models/addmedic.dart';
import 'package:final1/models/medic.dart';
import 'package:final1/models/medicament_service.dart';
import 'package:final1/models/patient_service.dart';
import 'package:final1/screens/medicament_screens/medicamen_modify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'create_new_medicament.dart';

class Medicament extends StatefulWidget {
  @override
  _MedicamentState createState() => _MedicamentState();
}

class _MedicamentState extends State<Medicament> {
  List<Medic> _list = [];
  List<Medic> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/Medicaments';
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
          _list.add(Medic.formJson(i));
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
      if (f.DESIGN.contains(text) || f.DESIGN.toLowerCase().contains(text))
        _search.add(f);
    });
    setState(() {});
  }

  MedicamentService get medicService => GetIt.I<MedicamentService>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Les Médicaments"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.restore_page),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Medicament()),
            );
          },
        ),
      ]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 8, 8),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "LABO",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "NOM",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "FAMILLE",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "ID",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
                                  actions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Modifier',
                                      color: Colors.blue,
                                      icon: Icons.more,
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MedicamentModify(
                                                    id: b.ID,
                                                    DESIGN: b.DESIGN,
                                                    LABO: b.LABO,
                                                    FAMILLE: b.FAMILLE,
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
                                          final medic = AddMedic(
                                            ID: b.ID,
                                          );
                                          final deleteresult =
                                              medicService.deleteMedic(medic);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Medicament()),
                                          );
                                        }),
                                  ],
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                avatar: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.orange,
                                                    child: Text(b.LABO[0],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                                label: Text(b.LABO,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(b.DESIGN,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(b.FAMILLE,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(b.ID.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  actions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Modifier',
                                      color: Colors.blue,
                                      icon: Icons.more,
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MedicamentModify(
                                                    id: a.ID,
                                                    DESIGN: a.DESIGN,
                                                    LABO: a.LABO,
                                                    FAMILLE: a.FAMILLE,
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
                                          final medic = AddMedic(
                                            ID: a.ID,
                                          );
                                          final deleteresult =
                                              medicService.deleteMedic(medic);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Medicament()),
                                          );
                                        }),
                                  ],
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                avatar: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.orange,
                                                    child: Text(a.LABO[0],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                                label: Text(a.LABO,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(a.DESIGN,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(a.FAMILLE,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Wrap(
                                            // set your alignment
                                            children: <Widget>[
                                              Chip(
                                                label: Text(a.ID.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                backgroundColor: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NewMedicament()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
