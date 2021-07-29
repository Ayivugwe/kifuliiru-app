import 'dart:ui';

import 'package:flutter/material.dart';
import 'radio_ibufuliiru.dart';
import 'gambo_lihyahya.dart';
import 'myazi.dart';
import 'site_web_yitu.dart';
import 'twehe.dart';
import 'kifuliiru_ne_kifuliiru.dart';
import 'kifuliiru_ne_kifaransa.dart';
import 'kifuliiru_ne_kingereza.dart';
import 'kifuliiru_ne_kiswahili.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'SOBAANURA KIFULIIRU';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageWidgetState createState() => _MyHomePageWidgetState();
  final String title = '';
}

class _MyHomePageWidgetState extends State<MyHomePage> {
  //_MyHomePageWidgetState({Key key, this.title}) : super(key: key);
  int navigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MAGAMBO GE KIFULIIRU',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.lightGreen,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(child: Text("New Chat"), value: "/newchat"),
              PopupMenuItem(
                  child: Text("New Group Chat"), value: "/new-group-chat"),
              PopupMenuItem(child: Text("Settings"), value: "/settings"),
            ],
            onSelected: (route) {
              print(route);
              // Note You must create respective pages for navigation
              Navigator.pushNamed(context, "/newchat");
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.0),
              children: [
                Card(
                  child: Container(
                    height: 250,
                    width: 400,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 80,
                                      child: Image.asset(
                                          'icons/flags/png/cd.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 155,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.lightGreen),
                                        ),
                                        child: Text(
                                          'Kifuliiru-Kifuliiru',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KifuliiruNeKifuliiru()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 80,
                                      child: Image.asset(
                                          'icons/flags/png/tz.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 155,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.lightGreen),
                                        ),
                                        child: Text('Kifuliiru-Kiswahili'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KifuliiruNeKiswahili()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 250,
                    width: 400,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 80,
                                      child: Image.asset(
                                          'icons/flags/png/fr.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 155,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.lightGreen),
                                        ),
                                        child: Text('Kifuliiru-Kifaransa'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KifuliiruNeKifaransa()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 80,
                                      child: Image.asset(
                                          'icons/flags/png/us.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.lightGreen),
                                        ),
                                        child: Text('Kifuliiru-Kingereza'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KifuliiruNeKingereza()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('SOBANUURA KIFULIIRU'),
            ),
            ListTile(
              title: Text('Yongera igambo lihyahya'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamboLihyahya()),
                );
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Imyazi'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Infos()),
                );
              },
            ),
            ListTile(
              title: Text('Myazi yiitu(Twehe)'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            ListTile(
              title: Text('Namuyehuulo witu'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SiteWebYitu()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Ndondeezo',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.radio),
            label: 'Radio Ibufuliiru',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Tuganuule'),
        ],
        onTap: (int index) {
          setState(() {
            navigationIndex = index;
            switch (navigationIndex) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RadioIbufuliiru()));
                break;
              case 2:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chat()));
                break;
            }
          });
        },
      ),
    );
  }
}
