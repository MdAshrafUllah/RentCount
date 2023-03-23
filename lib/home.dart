import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentapp/tickets.dart';
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

String imageurl = ' ';
String CurrentPic = ' ';

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

  void uploadCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
        '_' +
        Random().nextInt(10000).toString() +
        '.jpg';
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((pImage) {
      print(pImage);
      setState(() {
        imageurl = pImage;
      });
    });
    String downloadUrl = await ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["email"] == user?.email) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(doc.id)
              .update({'profileImage': downloadUrl.toString()});
        }
      });
    });
  }

  void uploadGalleryImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
        '_' +
        Random().nextInt(10000).toString() +
        '.jpg';
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((pImage) {
      setState(() {
        imageurl = pImage;
      });
    });
    String downloadUrl = await ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["email"] == user?.email) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(doc.id)
              .update({'profileImage': downloadUrl.toString()});
        }
      });
    });
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
              color: Colors.white,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              }),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue[200],
        iconTheme: IconThemeData(color: Colors.green, size: 35.0),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .get()
                      .then((QuerySnapshot querySnapshot) {
                    querySnapshot.docs.forEach((doc) {
                      if (doc["email"] == user?.email) {
                        setState(() {
                          CurrentPic = doc["profileImage"];
                        });
                      }
                    });
                  });
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
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
                radius: 80.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 33.0,
                  backgroundImage: imageurl != " "
                      ? NetworkImage(imageurl)
                      : NetworkImage(CurrentPic),
                  child: Transform.translate(
                    offset: Offset(0, 30),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  height: 120,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          uploadCameraImage();
                                          Navigator.pop(context);
                                        },
                                        leading: Icon(
                                          Icons.camera,
                                          color: Colors.green,
                                        ),
                                        title: Text('Camera'),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          uploadGalleryImage();
                                          Navigator.pop(context);
                                        },
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
                      },
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white, // set the background color here
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.green,
                        ),
                      ),
                    ),
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
                Icons.confirmation_num,
              ),
              title: const Text('Buy Tickets'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ticketsbook()));
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/others/home_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
                child: Text('Buy Tickets'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ticketsbook()));
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
      ),
    );
  }
}
