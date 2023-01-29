import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/android.png",
                height: 150,
                width: 150,
              ),
              Text(
                "version: 1.0",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 400,
                child: Text(
                  "it's a rent count app. you can use this application to see what's the rent between two places.This is an first version of this application.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Devloped By",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                child: Text(
                  "Md Ashraf Ullah",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                onTap: () =>
                    // ignore: deprecated_member_use
                    launch('https://www.facebook.com/MdAshrafUllahShafayet'),
              ),
              SizedBox(height: 50),
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
          ),
        ),
      ),
    );
  }
}
