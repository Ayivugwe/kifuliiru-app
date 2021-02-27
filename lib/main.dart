import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sobanura_kifuliiru/radio_ibufuliiru.dart';
import 'gambo_lihyahya.dart';
import 'myazi.dart';
import 'site_web_yitu.dart';
import 'twehe.dart';
import 'kifuliiru_ne_kifuliiru.dart';
import 'kifuliiru_ne_kifaransa.dart';
import 'kifuliiru_ne_kingereza.dart';
import 'kifuliiru_ne_kiswahili.dart';
import 'package:sobanura_kifuliiru/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Sobanura Kifuliiru';

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
        title: Text('Sobanuura - Tumenye Kifuliiru'),
      ),
      backgroundColor: Colors.greenAccent[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  //bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  //bottomLeft: Radius.circular(40.0)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.greenAccent[400],
                    child: Expanded(
                        child: Column(
                      children: [
                        Image.asset('icons/flags/png/cd.png',
                            package: 'country_icons'),
                        RaisedButton(
                          color: Colors.yellow,
                          textColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red)),
                          child: Text('Kifuliiru-Kifuliiru'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KifuliiruNeKifuliiru()),
                            );
                          },
                        ),
                      ],
                    )),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.greenAccent[400],
                      ),
                      child: Expanded(
                          child: Column(
                        children: [
                          Image.asset('icons/flags/png/tz.png',
                              package: 'country_icons'),
                          RaisedButton(
                            child: Text('Kifuliiru-Kiswahili'),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKiswahili()),
                              );
                            },
                          ),
                        ],
                      ))),
                ],
              ),
            )),
            Center(
                child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    //topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    //topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.greenAccent[400],
                      ),
                      child: Expanded(
                          child: Column(
                        children: [
                          Image.asset('icons/flags/png/fr.png',
                              package: 'country_icons'),
                          RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.red)),
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
                        ],
                      ))),
                  Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[400],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.purple,
                      ),
                      child: Expanded(
                          child: Column(
                        children: [
                          Image.asset('icons/flags/png/gb.png',
                              package: 'country_icons'),
                          RaisedButton(
                            child: Text('Kifuliiru-Kingereza'),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKingereza()),
                              );
                            },
                          ),
                        ],
                      ))),
                ],
              ),
            )),
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
            title: new Text('Ndondeezo'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.radio),
            title: new Text('Radio Ibufuliiru'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('Tuganuule')),
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
