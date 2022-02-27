// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'kifuliiru.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'KIFULIIRU NDETO YIITU';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        elevation: 0,
        title: const Text(
          'KIFULIIRU NDETO YIITU',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        //backgroundColor: HexColor('#f2d7d5'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.red[100],
      body: Center(
        child: ListView(children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  // color: HexColor('#f2d7d5'),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                    child: Text(
                      "Muyegerere tumenye indeto yitu Kifuliiru",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /* Image.asset(
                      'assets/images/imageHome.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width - 10,
                      height: 210,
                    ), */
                  ),
                ],
              )),
          Container(
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Magambo ge\'Kifuliiru',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
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
                                      const KifuliiruNeKifuliiru()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: const [
                                Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      backgroundImage: AssetImage(
                                        'assets/images/rdc.png',
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru-Kifuliiru',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KifuliiruNeKiswahili()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/tanzania.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                      bottom: 20,
                                      child: Text(
                                        'Kifuliiru-Kiswahili',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ]),
                          ),
                        ),
                      ]),
                  const SizedBox(
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
                                  builder: (context) => KifuliiruNeKifaransa()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/france.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru - Kifaransa',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KifuliiruNeKingereza()),
                            );
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white54,
                            ),
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  Positioned(
                                    top: 20,
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/USA.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Kifuliiru - Kingereza',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    // color: HexColor('#f2d7d5'),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Bingi ku Kifuliiru',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kifuliiru ndeto yitu. Ngisi Mufuliiru amusima indeto yage, yo na ndeto yitu : Kifuliiru. Tukabika kino kibaja hano higulu tugwase abandu tumenye bingi ku ndeto yitu.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Kifuliiru()),
                                      );
                                    },
                                    child: Text('Menya bingi hano'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Kifuliiru()),
                                      );
                                    },
                                    child: Text('Yuvwiriza i Kifuliiru'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])),
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              color: Colors.white70,
              height: 80,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Longa imyazi mu Kifuliiru',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Container(
            height: 350,
            decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                )),
            child: PageView(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/kifuliiru.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.favorite),
                              Icon(Icons.share),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myazi()),
                  );
                },
                icon: Icon(Icons.more_sharp),
                label: Text('Longa imyazi mingi')),
          ),
          SizedBox(
            height: 20,
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
            ListTile(
              title: Text('Yongera igambo lihyahya'),
              leading: Icon(
                Icons.add,
              ),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamboLihyahya()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
            ListTile(
              leading: Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              /*  trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: Text('Kifuliiru-Kiswahili'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KifuliiruNeKiswahili()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              tileColor: Colors.white,
              /*  trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: Text('Kifuliiru-Kifaransa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KifuliiruNeKifaransa()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
            Divider(),
            ListTile(
              leading: Icon(Icons.list_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
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
            activeIcon: new Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Ndondeezo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.radio,
              color: Colors.black,
            ),
            label: 'Radio Ibufuliiru',
          ),
          BottomNavigationBarItem(
            icon: Icon(
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
