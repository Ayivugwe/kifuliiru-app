import 'package:flutter/material.dart';
import 'gambo_lihyahya.dart';
import 'myazi.dart';
import 'site_web_yitu.dart';
import 'twehe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _yongeraIgambo() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GamboLihyahya()),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Sobanuura Kifuliiru'),
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
                  title: Text('Yongera ingambo lihyahya'),
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
                  title: Text('Informations'),
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
                  title: Text('Myazi yitu'),
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
                  title: Text('Site yitu'),
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
          body: TabBarView(
            children: [
              //Icon(Icons.directions_car),
              Center(
                  child: Container(
                //alignment: Align(1.0, 1.0),
                color: Color.fromARGB(255, 255, 255, 245),
                child: Container(
                  child: new Text('Loza igambo mu Kifuliiru naho'),
                ),
              )),

              //Icon(Icons.directions_transit),
              Center(
                  child: Container(
                //alignment: Align(1.0, 1.0),
                color: Color.fromARGB(255, 255, 255, 245),
                child: Container(
                  child: new Text('Loza igambo mu Kifuliiru na mu Kishahili'),
                ),
              )),

              // Icon(Icons.directions_bike),
              Center(
                  child: Container(
                //alignment: Align(1.0, 1.0),
                color: Color.fromARGB(255, 255, 255, 245),
                child: Container(
                  child: new Text('Loza igambo mu Kifuliiru ne Kifaransa'),
                ),
              )),

              //Icon(Icons.directions_bike),
              Center(
                  child: Container(
                //alignment: Align(1.0, 1.0),
                color: Color.fromARGB(255, 255, 255, 245),
                child: Container(
                  child: new Text('Loza igambo mu Kifuliiru na mu Kingereza'),
                ),
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _yongeraIgambo,
            tooltip: 'Gambo lihyahya',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
