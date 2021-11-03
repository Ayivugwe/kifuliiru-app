import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: ListView(children: [
          Card(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Muyegerere Tumenye Indeto Yiitu : Kifuliiru',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                          'Indeto yiitu twehe twe\'beno yo. \nTugisime, tugimenye, tugimenyeese na\'bandi bandu.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                )),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text('Magambo ge\'Kifuliiru'),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKifuliiru()),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueAccent.shade100,
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned(
                                      top: 40,
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        backgroundImage: AssetImage(
                                          'assets/images/rdc.png',
                                        ),
                                      )),
                                  Positioned(
                                      bottom: 20,
                                      child: Text('Kifuliiru-Kifuliiru'))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKiswahili()),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueAccent.shade100,
                              ),
                              child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Positioned(
                                      top: 20,
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/Tanzania.png'),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 20,
                                        child: Text('KIfuliiru-Kiswahili'))
                                  ]),
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKifaransa()),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueAccent.shade100,
                              ),
                              child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Positioned(
                                      top: 20,
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/france.png'),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      child: Text('Kifuliiru - Kifaransa'),
                                    ),
                                  ]),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KifuliiruNeKingereza()),
                              );
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.blueAccent,
                              ),
                              child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Positioned(
                                      top: 20,
                                      height: 100,
                                      width: 100,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/images/USA.png'),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      child: Text('Kifuliiru - Kingereza'),
                                    ),
                                  ]),
                            ),
                          ),
                        ]),
                  ],
                )
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Text('Gundi mwazi'),
            ),
          ),
          Card(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: [
                  Container(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 20,
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/kifuliiru.png'),
                        ),
                        Positioned(
                          bottom: 40,
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                        ),
                        Positioned(
                            bottom: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.favorite),
                                Icon(Icons.share),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.all(5),

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
            Divider(),
            Card(
              child: ListTile(
                title: Text('Yongera igambo lihyahya'),
                leading: Icon(
                  Icons.add,
                  size: 30,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamboLihyahya()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.flag,
                  color: Colors.blue,
                  size: 30,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                tileColor: Colors.white,
                title: Text('Kifuliiru-Kifuliiru'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KifuliiruNeKifuliiru()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.flag,
                  color: Colors.blue,
                  size: 30,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Kifuliiru-Kiswahili'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KifuliiruNeKiswahili()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.flag,
                  color: Colors.blue,
                  size: 30,
                ),
                tileColor: Colors.white,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Kifuliiru-Kifaransa'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KifuliiruNeKifaransa()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.flag, color: Colors.blue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Kifuliiru-Kingereza'),
                hoverColor: Colors.greenAccent.shade700,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KifuliiruNeKingereza()),
                  );
                },
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                leading: Icon(Icons.list_rounded, color: Colors.blue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Imyazi'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myazi()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.question_answer, color: Colors.blue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Twehe'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyaziYitu()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.web_rounded, color: Colors.blue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
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
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.radio, color: Colors.blue),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                title: Text('Radio Ibufuliiru'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RadioIbufuliiru()),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                trailing: Icon(Icons.dark_mode),
                title: Text('Hindula'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: new Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Ndondeezo',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.radio,
              color: Colors.black,
            ),
            label: 'Radio Ibufuliiru',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.list_alt,
              color: Colors.black,
            ),
            label: 'Myazi mu Kifuliiru',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.chat,
                color: Colors.blue,
              ),
              label: 'Tuganuule'),
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
                    context, MaterialPageRoute(builder: (context) => Myazi()));
                break;
              case 3:
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

class Imyazi {}
