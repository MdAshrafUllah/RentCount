import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './rentcount.dart';
import './fuelprice.dart';
import './About.dart';
import 'dart:math';

import 'theme.dart';

class RentCount extends StatefulWidget {
  const RentCount({super.key});

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
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // handle the back button press
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
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                "Md Ashraf Ullah",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "mdashrafullah47@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage: NetworkImage(
                    "https://scontent.fcgp3-2.fna.fbcdn.net/v/t39.30808-6/247865594_3052683804989958_1876369014597449444_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=174925&_nc_eui2=AeFjrk9MdcK6yIQZ2Ius267VG4684k4vS5IbjrziTi9LkjvBFEWTvbQ0E1f6pnwas00h8rpMLHvkDYK_wFerjqzT&_nc_ohc=X_xj-J_w-0kAX8HeWj0&_nc_ht=scontent.fcgp3-2.fna&oh=00_AfBTQ2EutX7iW9beyjwGvn1Z3tz3J0OAamybEzWdjKRCdA&oe=63ED062D"), // for Network image
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
              onTap: () {},
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

  loginPage() {}
}
