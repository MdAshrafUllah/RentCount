import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.green, size: 35.0),
        ),
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
                  color: Theme.of(context).iconTheme.color,
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
                    color: Theme.of(context).iconTheme.color,
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
                  color: Theme.of(context).iconTheme.color,
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
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 12,
                  ),
                ),
                onTap: () =>
                    // ignore: deprecated_member_use
                    launch('https://www.facebook.com/MdAshrafUllahShafayet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
