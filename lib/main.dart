import 'package:flutter/material.dart';
import 'rentcount.dart';
import './fuelprice.dart';
import './About.dart';

void main() => runApp(RentCount());

class RentCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.green,
            ),
      ),
      title: 'Rent Count',
      home: homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              child: Text('Rent Count'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fuelcount()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 24)),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              child: Text('Fuel Price'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fuelprice()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 24)),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              child: Text('About'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aboutpage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 24)),
            ),
          ),
        ]),
      ),
    );
  }
}
