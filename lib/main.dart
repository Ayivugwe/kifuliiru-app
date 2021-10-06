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
            Card(
              child: Container(
                padding: const EdgeInsets.all(2),
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
            ),
            Divider(),
            Container(
              height: 300,
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KifuliiruNeKifuliiru()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/rdc.png'),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/tanzania.png'),
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/france.png'),
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/USA.png'),
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
            Divider(),
            ListTile(
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

                Navigator.pop(context);
              },
            ),
            ListTile(
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

                Navigator.pop(context);
              },
            ),
            ListTile(
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

                Navigator.pop(context);
              },
            ),
            ListTile(
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

                Navigator.pop(context);
              },
            ),
            ListTile(
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

                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
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
            ListTile(
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
            ListTile(
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
            ListTile(
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
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              trailing: Icon(Icons.dark_mode),
              title: Text('Hindula'),
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
