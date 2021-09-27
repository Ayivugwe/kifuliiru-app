import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
//import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'KIFULIIRU NDETO YIITU';

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
        title: const Text(
          'KIFULIIRU NDETO YIITU',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset(
                'assets/images/ibufuliiru.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            InkWell(
                              child: Column(
                                children: [
                                  Image.asset('assets/images/rdc.png'),
                                  Text('Kifuliiru - Kifuliiru')
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              onTap: () => KifuliiruNeKifuliiru(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Image.asset('assets/images/Tanzania.png'),
                          Text('Kifuliiru - Kiswahili')
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Image.asset('assets/images/France.png'),
                          Text('Kifuliiru - Kifaransa')
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Image.asset('assets/images/USA.png'),
                          Text('Kifuliiru - Kingereza')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/rdc.png"),
                    fit: BoxFit.cover),
              ),
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

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    int previousPage = page;
    if (page != 0)
      previousPage--;
    else
      previousPage = 2;
    print("Previous page: $previousPage");
  }
}
