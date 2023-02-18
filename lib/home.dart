import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'dart:math';
import 'rentcount.dart';
import 'fuelprice.dart';
import 'About.dart';
import 'theme.dart';

class RentCount extends StatefulWidget {
  const RentCount({Key? key}) : super(key: key);
  @override
  State<RentCount> createState() => _RentCountState();
}

IconData _iconLight = Icons.light_mode;
IconData _iconDark = Icons.dark_mode;

class _RentCountState extends State<RentCount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Count',
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    if (auth.currentUser != null) {
      user = auth.currentUser;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              }),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.green, size: 35.0),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                '${user?.displayName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                '${user?.email}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                backgroundColor: Color(0xFF778899),
                // backgroundImage: AssetImage("assets/Gallery/profile.jpg"),
                child: IconButton(
                  onPressed: () {
                    showimagepicker(context);
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(themeProvider.isDarkMode ? _iconDark : _iconLight),
              title: const Text('Dark Mode'),
              trailing: ChangeThemeButtonWidget(),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: const Text('Language'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
              ),
              title: const Text('Invite Friends'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Aboutpage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
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

showimagepicker(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.camera,
                    color: Colors.green,
                  ),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.image,
                    color: Colors.green,
                  ),
                  title: Text('Gallery'),
                )
              ],
            ),
          ),
        );
      });
}
