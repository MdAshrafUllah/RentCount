import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class fuelcount extends StatefulWidget {
  const fuelcount({super.key});

  @override
  State<fuelcount> createState() => _fuelcountState();
}

class _fuelcountState extends State<fuelcount> {
  _fuelcountState() {
    _selectedval = _vehicletypes[0];
  }

  final _vehicletypes = [
    "Diesel Bus",
    "CNG Bus",
    "Diesel Tempo",
    "CNG Tempo",
    "Rickshaw"
  ];
  String? _selectedval = "";

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
                  horizontal: 50,
                ),
                child: Form(
                    child: Column(
                  children: [
                    Container(
                        child: SearchField(
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
                    )),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        child: SearchField(
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
                        labelText: "Select Vehicale Type",
                        hintText: "Select Vehicale Type",
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
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        "Count",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.green,
                      height: 50,
                      minWidth: 200,
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
