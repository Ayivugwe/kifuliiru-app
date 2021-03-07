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
  final appTitle = 'Sobaanura Kifuliiru';

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
        title: Text('Sobaanura - Tumenye Kifuliiru'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: (double.maxFinite / 2) - 5.0,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 190,
                                      width: (double.maxFinite / 2) - 2.0,
                                      child: Image.asset(
                                          'icons/flags/png/cd.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.yellow),
                                        ),
                                        child: Text('Kifuliiru-Kifuliiru'),
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
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: (double.maxFinite / 2) - 5.0,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 190,
                                      width: (double.maxFinite / 2) - 2.0,
                                      child: Image.asset(
                                          'icons/flags/png/cd.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.yellow),
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
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: (double.maxFinite / 2) - 5.0,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 190,
                                      width: (double.maxFinite / 2) - 2.0,
                                      child: Image.asset(
                                          'icons/flags/png/cd.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.yellow),
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
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: (double.maxFinite / 2) - 5.0,
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 190,
                                      width: (double.maxFinite / 2) - 2.0,
                                      child: Image.asset(
                                          'icons/flags/png/cd.png',
                                          package: 'country_icons'),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.yellow),
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
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Menya imyazi ne bindi bingi.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Image.asset('assets/card-sample-image.jpg'),
                  Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GamboLihyahya()),
        ),
        tooltip: 'Gambo lihyahya',
        child: Icon(Icons.add),
      ),
    );
  }
}
