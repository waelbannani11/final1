import 'package:flutter/material.dart';

class Modif extends StatefulWidget {
  @override
  _ModifState createState() => _ModifState();
}

class _ModifState extends State<Modif> {
  int _groupValue = -1;
  int _groupValue1 = -1;

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }

  void _handleRadioValueChangedd(int value) {
    setState(() {
      this._groupValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Patient patient =Provider.of<Patient>(context);

    final _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    final List countryList = ['celeb', 'marie', 'diforce'];

    //nom

    Widget _buildnom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'nom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
      );
    }

    //prenom
    Widget _buildprenom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'prenom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'lastname is Required';
          }

          return null;
        },
      );
    }

    //id
    Widget buildid() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'id',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'id is Required';
          }

          return null;
        },
      );
    }

    //code
    Widget buildnumfiche() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Num_fiche',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 30,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Num_fiche is Required';
          }

          return null;
        },
      );
    }
    //deb

    Widget builddatenai() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'Date de naissance',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        keyboardType: TextInputType.datetime,
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'date de naissance is Required';
          }

          return null;
        },
      );
    }

    //gender
    Widget _genderRadio(int groupValue, handleRadioValueChanged) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Sexe',
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged),
              Text(
                "Male",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: handleRadioValueChanged),
              Text(
                "Female",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          )
        ]);

    //etatcivil
    Widget _etatcivil(int groupValue1, handleRadioValueChangedd) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Etat civil',
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "celeb",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 1,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "marie",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Radio(
                  value: 2,
                  groupValue: groupValue1,
                  onChanged: handleRadioValueChangedd),
              Text(
                "divorce",
                style: new TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          )
        ]);
    //nation
    Widget _buildnationn() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'nationnalite',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'nationnalite is Required';
          }

          return null;
        },
      );
    }

    //profession
    Widget _buildprofession() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'profession',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'profession is Required';
          }

          return null;
        },
      );
    }

    //teldom
    Widget _buildteldom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'tel dom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'teldom is Required';
          }

          return null;
        },
      );
    }

    //    //telmob
    Widget _buildtelmob() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'tel mob',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 8,
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'telmob is Required';
          }

          return null;
        },
      );
    }

    //adresse
    Widget _buildadresse() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'adresse',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 50,
        maxLines: 2,
        validator: (String value) {
          if (value.isEmpty) {
            return 'adresse is Required';
          }

          return null;
        },
      );
    }

    //ville
    Widget _buildville() {
      return TextFormField(
        initialValue: '',
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

    //*************************************************** */

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Ajouter Patient"),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                //key: _formKey,
                child: Column(
                  children: <Widget>[
                    //MyBackButton(),
                    SizedBox(
                      height: 15,
                    ),
                    buildid(),
                    buildnumfiche(),
                    _buildnom(),
                    _buildprenom(),
                    builddatenai(),
                    _genderRadio(_groupValue, _handleRadioValueChanged),
                    _etatcivil(_groupValue1, _handleRadioValueChangedd),
                    _buildnationn(),
                    _buildprofession(),
                    _buildteldom(),
                    _buildtelmob(),
                    _buildadresse(),
                    _buildville(),
                    /*GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalendarPage()),
                          );
                          if (!_formKey.currentState.validate()) {
                          return;
                          }
                          _formKey.currentState.save();
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
                      ),**/
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
