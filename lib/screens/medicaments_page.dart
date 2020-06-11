import 'dart:convert';
import 'package:final1/models/medic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'create_new_patient.dart';

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
      if ( f.DESIGN.contains(text) || f.DESIGN.toLowerCase().contains(text))
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
        title: Text("Les Médicaments"),
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
            Row(
              children: <Widget>[
                SizedBox(height:60),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Container(
                      child:Center(child: Text("Nom",style: TextStyle(color:Colors.white),),), 
                      height: 50.0,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        color: Colors.blue,
                        border: new Border.all(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    child:Center(child: Text("Labo",style: TextStyle(color:Colors.white),),), 
                    height: 50.0,
                    decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(25.0),
                    color: Colors.blue,
                    border: new Border.all(
                      width: 2.0,
                      color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    child:Center(child: Text("Prix",style: TextStyle(color:Colors.white),),), 
                    height: 50.0,
                    decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(25.0),
                    color: Colors.blue,
                    border: new Border.all(
                      width: 2.0,
                      color: Colors.blue,
                        ),
                      ),
                    ),
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
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                          child: Text(b.DESIGN),
                                        ),), 
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
                                  ),SizedBox(height:60),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Text(b.LABO),), 
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
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Text((b.PRIX_REMB).toString()),), 
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
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                          child: Text(a.DESIGN),
                                        ),), 
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
                                  ),SizedBox(height:60),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Text(a.LABO),), 
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
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Container(
                                        child:Center(child: Text((a.PRIX_REMB).toString()),), 
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
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Createnvpatient() 
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}