import 'package:final1/models/addmedic.dart';
import 'package:final1/models/addpatient.dart';
import 'package:final1/models/medicament_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:string_validator/string_validator.dart';

import 'medicaments_page.dart';

class NewMedicament extends StatefulWidget {
  @override
  _NewMedicamentState createState() => _NewMedicamentState();
}

class _NewMedicamentState extends State<NewMedicament> {
  String errorMessage;

  MedicamentService get medicamentService => GetIt.I<MedicamentService>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _DESIGNController = TextEditingController();
  TextEditingController _LABOController = TextEditingController();
  TextEditingController _FAMILLEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;

    //ID
    Widget _buildID() {
      return TextFormField(
        controller: _idController,
        decoration: InputDecoration(
            labelText: 'ID',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty || !isNumeric(value)) {
            return 'ID is Required';
          }
          return null;
        },
      );
    }

    //DESIGN
    Widget _buildDESIGN() {
      return TextFormField(
        controller: _DESIGNController,
        decoration: InputDecoration(
            labelText: 'NOM',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 50,
        validator: (String value) {
          if (value.isEmpty) {
            return 'NOM is Required';
          }
          return null;
        },
      );
    }

    //LABO
    Widget _buildLABO() {
      return TextFormField(
        controller: _LABOController,
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
        controller: _FAMILLEController,
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
        title: Text("Ajouter Medicament "),
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
                        final medic = AddMedic(
                          ID: int.parse(_idController.text),
                          DESIGN: _DESIGNController.text,
                          LABO: _LABOController.text,
                          FAMILLE: _FAMILLEController.text,
                        );
                        final result =
                            await medicamentService.createMedic(medic);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Medicament()),
                        );
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
                            content: Container(
                              height: MediaQuery.of(context).size.height / 2.5,
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
                                      "Ajouté avec succès",
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
