import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'dart:math';

class fuelcount extends StatefulWidget {
  const fuelcount({super.key});

  @override
  State<fuelcount> createState() => _fuelcountState();
}

class _fuelcountState extends State<fuelcount> {
  _fuelcountState() {
    _selectedval = _vehicletypes[0];
  }
  final TextEditingController _searchfildcontroller = TextEditingController();
  final TextEditingController _searchfildcontroller2 = TextEditingController();
  final TextEditingController _rentcount = TextEditingController();

  final _vehicletypes = [
    "Diesel Bus",
    "CNG Bus",
    "Diesel Tempo",
    "CNG Tempo",
    "Rickshaw"
  ];
  String? _selectedval = "";

  final _rent = [
    "5 TK",
    "6 TK",
    "7 TK",
    "8 TK",
    "10 TK",
    "12 TK",
    "14 TK",
    "20 TK",
    "30 TK",
    "40 TK",
    "50 TK",
    "60 TK"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Count Rent',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Form(
                    child: Column(
                  children: [
                    Container(
                      child: SearchField(
                        controller: _searchfildcontroller,
                        hint: 'search',
                        searchInputDecoration: InputDecoration(
                            labelText: 'From',
                            hintText: 'From',
                            prefixIcon: Icon(Icons.add_location),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green.withOpacity(0.8),
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search)),
                        itemHeight: 50,
                        maxSuggestionsInViewPort: 6,
                        suggestionsDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        suggestions: [
                          'Muradpur',
                          'Boddorhat',
                          'GEC',
                          'Lalkhan Bazar',
                          'Oxyzen',
                          'Tiger Pass',
                          'Wasa',
                          'DewanHat',
                          'Chomohuni',
                          'Agrabad',
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 50,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Center(
                              child: IconButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            icon: Icon(Icons.compare_arrows),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {
                              String n = _searchfildcontroller.text;
                              _searchfildcontroller.text =
                                  _searchfildcontroller2.text;
                              _searchfildcontroller2.text = n;
                            },
                          )),
                        ),
                      ),
                    ),
                    Container(
                        child: SearchField(
                      controller: _searchfildcontroller2,
                      hint: 'search',
                      searchInputDecoration: InputDecoration(
                        labelText: 'To',
                        hintText: 'To',
                        prefixIcon: Icon(Icons.add_location_alt),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green.withOpacity(0.8), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search),
                      ),
                      itemHeight: 50,
                      maxSuggestionsInViewPort: 6,
                      suggestionsDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      suggestions: [
                        'Muradpur',
                        'Boddorhat',
                        'GEC',
                        'Lalkhan Bazar',
                        'Oxyzen',
                        'Tiger Pass',
                        'Wasa',
                        'DewanHat',
                        'Chomohuni',
                        'Agrabad',
                      ],
                    )),
                    SizedBox(
                      height: 25,
                    ),
                    DropdownButtonFormField(
                      value: _selectedval,
                      items: _vehicletypes.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedval = val as String;
                        });
                      },
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.green,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.airport_shuttle_rounded),
                        labelText: "Select Vehicle Type",
                        hintText: "Select Vehicle Type",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green.withOpacity(0.8), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        child: TextField(
                      enabled: false,
                      controller: _rentcount,
                      decoration: InputDecoration(
                        labelText: 'Rent is',
                        hintText: 'Rent is',
                        prefixIcon: Icon(Icons.account_balance_wallet),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green.withOpacity(0.8), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(),
                      ),
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: (() {
                              setState(() {
                                _searchfildcontroller.text = "";
                                _searchfildcontroller2.text = "";
                                _selectedval = _vehicletypes[0];
                                _rentcount.text = "";
                              });
                            }),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.yellow.shade800,
                            height: 50,
                            minWidth: 142,
                          ),
                          SizedBox(width: 25),
                          MaterialButton(
                            onPressed: () {
                              if (_searchfildcontroller.text ==
                                  _searchfildcontroller2.text) {
                                showAlertDialog(context);
                              } else {
                                if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text == 'GEC' &&
                                        _selectedval == _vehicletypes[0] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'GEC' &&
                                        _selectedval == _vehicletypes[0]) {
                                  _rentcount.text = _rent[4];
                                } else if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text == 'GEC' &&
                                        _selectedval == _vehicletypes[1] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'GEC' &&
                                        _selectedval == _vehicletypes[1]) {
                                  _rentcount.text = _rent[0];
                                } else if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text == 'GEC' &&
                                        _selectedval == _vehicletypes[2] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'GEC' &&
                                        _selectedval == _vehicletypes[2]) {
                                  _rentcount.text = _rent[5];
                                } else if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text == 'GEC' &&
                                        _selectedval == _vehicletypes[3] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'GEC' &&
                                        _selectedval == _vehicletypes[3]) {
                                  _rentcount.text = _rent[0];
                                } else if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text == 'GEC' &&
                                        _selectedval == _vehicletypes[4] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'GEC' &&
                                        _selectedval == _vehicletypes[4]) {
                                  _rentcount.text = _rent[9];
                                  //Boddorhat -- muradpur
                                } else if (_searchfildcontroller.text == 'Muradpur' && _searchfildcontroller2.text == 'Boddorhat' && _selectedval == _vehicletypes[0] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text ==
                                            'Boddorhat' &&
                                        _selectedval == _vehicletypes[0]) {
                                  _rentcount.text = _rent[4];
                                } else if (_searchfildcontroller.text == 'Muradpur' && _searchfildcontroller2.text == 'Boddorhat' && _selectedval == _vehicletypes[1] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text ==
                                            'Boddorhat' &&
                                        _selectedval == _vehicletypes[1]) {
                                  _rentcount.text = _rent[0];
                                } else if (_searchfildcontroller.text == 'Muradpur' &&
                                        _searchfildcontroller2.text ==
                                            'Boddorhat' &&
                                        _selectedval == _vehicletypes[2] ||
                                    _searchfildcontroller2.text == 'Muradpur' &&
                                        _searchfildcontroller.text == 'Boddorhat' &&
                                        _selectedval == _vehicletypes[2]) {
                                  _rentcount.text = _rent[4];
                                } else if (_searchfildcontroller.text == 'Muradpur' && _searchfildcontroller2.text == 'Boddorhat' && _selectedval == _vehicletypes[3] || _searchfildcontroller2.text == 'Muradpur' && _searchfildcontroller.text == 'Boddorhat' && _selectedval == _vehicletypes[3]) {
                                  _rentcount.text = _rent[0];
                                } else if (_searchfildcontroller.text == 'Muradpur' && _searchfildcontroller2.text == 'Boddorhat' && _selectedval == _vehicletypes[4] || _searchfildcontroller2.text == 'Muradpur' && _searchfildcontroller.text == 'Boddorhat' && _selectedval == _vehicletypes[4]) {
                                  _rentcount.text = _rent[7];
                                } else {
                                  _rentcount.text = "Not Include";
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "Count",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.green,
                            height: 50,
                            minWidth: 142,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_circle_left),
                        iconSize: 50,
                        color: Colors.red[900],
                        onPressed: () {
                          Navigator.pop(context); // handle button press
                        },
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("⚠ Warning"),
    content: Text("Please, Select Two Different locations."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
