import 'package:final1/models/addmedic.dart';
import 'package:final1/models/medicament_service.dart';
import 'package:final1/screens/medicament_screens/medicaments_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MedicamentModify extends StatefulWidget {
  int id;
  String DESIGN;
  String LABO;
  String FAMILLE;
  MedicamentModify({
    this.id,
    this.DESIGN,
    this.LABO,
    this.FAMILLE,
  });
  @override
  _MedicamentModifyState createState() => _MedicamentModifyState(
        id,
        DESIGN,
        LABO,
        FAMILLE,
      );
}

class _MedicamentModifyState extends State<MedicamentModify> {
  int id;
  String DESIGN;
  String LABO;
  String FAMILLE;
  _MedicamentModifyState(
    this.id,
    this.DESIGN,
    this.LABO,
    this.FAMILLE,
  );

  MedicamentService get medicamentService => GetIt.I<MedicamentService>();
  TextEditingController _idConttoller = TextEditingController();
  TextEditingController _DESIGNConttoller = TextEditingController();
  TextEditingController _LABOConttoller = TextEditingController();
  TextEditingController _FAMILLEConttoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _idConttoller.text = (id).toString();
    _DESIGNConttoller.text = DESIGN;
    _LABOConttoller.text = LABO;
    _FAMILLEConttoller.text = FAMILLE;

    final _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;

    //ID
    Widget _buildID() {
      return TextFormField(
        enabled: false,
        controller: _idConttoller,
        decoration: InputDecoration(
            labelText: 'ID',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
      );
    }

    //DESIGN
    Widget _buildDESIGN() {
      return TextFormField(
        controller: _DESIGNConttoller,
        decoration: InputDecoration(
            labelText: 'NOM',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 50,
        validator: (String value) {
          if (value.isEmpty) {
            return 'NOM EMPTY';
          }
          return null;
        },
      );
    }

    //LABO
    Widget _buildLABO() {
      return TextFormField(
        controller: _LABOConttoller,
        decoration: InputDecoration(
            labelText: 'LABO',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'LABO is Required';
          }
          return null;
        },
      );
    }

    //Famille
    Widget _buildFamille() {
      return TextFormField(
        controller: _FAMILLEConttoller,
        decoration: InputDecoration(
            labelText: 'Famille',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Famille is Required';
          }
          return null;
        },
      );
    }

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Modifier Medicament "),
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
                    _buildID(),
                    _buildDESIGN(),
                    _buildLABO(),
                    _buildFamille(),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          final medic = AddMedic(
                            ID: int.parse(_idConttoller.text),
                            DESIGN: _DESIGNConttoller.text,
                            LABO: _LABOConttoller.text,
                            FAMILLE: _FAMILLEConttoller.text,
                          );
                          final result =
                              await medicamentService.updatemedic(medic);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Medicament()),
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
                                        "Vous pouvez suivre le nouveau médicament dans la page des médicaments ",
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
