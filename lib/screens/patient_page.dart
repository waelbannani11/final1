import 'dart:convert';
import 'package:final1/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Patients extends StatefulWidget {
  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  List<Patient> _list = [];
  List<Patient> _search = [];
  var loading = false;
  var url = 'http://10.0.3.2:5000/patient';
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
      if (f.nom.toLowerCase().contains(text) || f.prenom.toLowerCase().contains(text))
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
        title: Container(
              padding: EdgeInsets.all(1.0),
              color: Colors.black,
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
      ),
      body: Container(
        child: Column(
          children: <Widget>[
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
                                border: TableBorder.all(),
                                columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.1), 3: FractionColumnWidth(.1)},
                                children: [
                                  TableRow(
                                    children:[
                                      Column(
                                        children: <Widget>[
                                          Text(b.nom),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(b.prenom),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(b.sex),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text((b.statusmatriomo_id).toString()),
                                          
                                        ],
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
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(1.0),
                                      
                                      child:Center(child: Text(a.nom),), 
                                      width: 10.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child:Center(child: Text(a.prenom),), 
                                      width: 10.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child:Center(child: Text(a.sex),), 
                                      width: 10.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child:Center(child: Text((a.statusmatriomo_id).toString())), 
                                      width: 10.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
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