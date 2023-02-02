import 'package:flutter/material.dart';

class fuelprice extends StatelessWidget {
  const fuelprice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(children: <Widget>[
        SizedBox(height: 100),
        Center(
            child: Text(
          'Per Liter Fuel Price',
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 25),
        DataTable(
          decoration: BoxDecoration(color: Colors.green[50]),
          columns: [
            DataColumn(
                label: Text('No',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Fuel',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Prices',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Diesel')),
              DataCell(Text('109 TK')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Petrol')),
              DataCell(Text('120 TK')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Octane')),
              DataCell(Text('130 TK')),
            ]),
            DataRow(cells: [
              DataCell(Text('4')),
              DataCell(Text('LPG')),
              DataCell(Text('57 TK')),
            ]),
          ],
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
      ])),
    );
  }
}
