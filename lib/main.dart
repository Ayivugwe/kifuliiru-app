import 'package:flutter/material.dart';
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
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobanuura Kifuliiru'),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: Expanded(
                  child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.android),
                    color: Colors.white,
                    iconSize: 80.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KifuliiruNeKifuliiru()),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Kifuliiru-Kifuliiru'),
                    color: Colors.teal[200],
                  ),
                ],
              )),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                //color: Colors.pink[100],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: Colors.blueAccent,
                ),
                child: Expanded(
                    child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.android),
                      color: Colors.white,
                      iconSize: 80.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KifuliiruNeKiswahili()),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Kifuliiru-Kiswahili'),
                      color: Colors.teal[200],
                    ),
                  ],
                ))),
            Container(
                padding: const EdgeInsets.all(8),
                // color: Colors.teal[300],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: Colors.green,
                ),
                child: Expanded(
                    child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.android),
                      color: Colors.white,
                      iconSize: 80.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KifuliiruNeKifaransa()),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Kifuliiru-Kifaransa'),
                      color: Colors.teal[200],
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
                    IconButton(
                      icon: Icon(Icons.android),
                      color: Colors.white,
                      iconSize: 80.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KifuliiruNeKingereza()),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('Kifuliiru-Kingereza'),
                      // color: Colors.teal[200],
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ))),
          ],
        ),
      ),
      //Icon(Icons.directions_transit),

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
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Tuyandikire'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), title: Text('Tuganuule')),
        ],
        //onTap: (),
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
