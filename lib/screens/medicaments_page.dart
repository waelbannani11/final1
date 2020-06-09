import 'dart:convert';
import 'package:final1/models/medic.dart';
import 'package:final1/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Medicament extends StatefulWidget {
  @override
  _MedicamentState createState() => _MedicamentState();
}

class _MedicamentState extends State<Medicament> {
  List<Medic> _list = [];
  List<Medic> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/medic';
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    var response =
        await http.get(url);
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
      if (f.DESIGN.contains(text) || f.LABO.contains(text))
        _search.add(f);
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
        title:Text("Medicaments"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
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
                              return Table(
                                border: TableBorder(
                                  left: BorderSide.none,
                                  right: BorderSide.none,
                                  top: BorderSide.none,
                                  bottom: BorderSide( 
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.1), 3: FractionColumnWidth(.1)},
                                children: [
                                  TableRow(
                                    children:[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            Text(b.DESIGN),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            Text(b.LABO),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            //Text((b.PRIX_REF).toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              return Table(
                                border: TableBorder(
                                  left: BorderSide.none,
                                  right: BorderSide.none,
                                  top: BorderSide.none,
                                  bottom: BorderSide( 
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                
                                columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.1), 3: FractionColumnWidth(.1)},
                                children: [
                                  TableRow(
                                    children:[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            Text(a.DESIGN),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            Text(a.LABO),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                        child: Column(
                                          children: [
                                            //Text((a.PRIX_REF).toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}