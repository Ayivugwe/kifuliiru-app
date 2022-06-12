import 'package:flutter/material.dart';
import 'package:kifuliiru_app/settings.dart';
import 'radio_ibufuliiru.dart';
import 'gambo_lihyahya.dart';
import 'imyazi.dart';
import 'site_web_yitu.dart';
import 'twehe.dart';
import 'kifuliiru_ne_kifuliiru.dart';
import 'kifuliiru_ne_kifaransa.dart';
import 'kifuliiru_ne_kingereza.dart';
import 'kifuliiru_ne_kiswahili.dart';
import 'chat.dart';

class Home extends StatelessWidget {
  final appTitle = 'KIFULIIRU NDETO YIITU';

  const Home({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            color: Colors.red,
            tooltip: 'Imyazi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Longa imyazi mu Kifuliiru')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Paramètres',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));

              //Navigator.MaterialPageRoute(builder: (context) => Settings());
            },
          ),
        ],
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
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10.0, left: 20.0, right: 20.0, top: 40.0),
              child: Column(
                children: const [
                  Text(
                    'Tuli Bafuliiru. Menya bingi ku Kifuliiru Ndeto Yitu, ndeto ngale.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Tuyegerere. Guno mukolwa guli hano higulu gututabaale tumenye bingi hingulu lye\'ndeto yiitu Kifuliiru.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                'Kifuliiru',
                style: TextStyle(
                  fontSize: 20,
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
                                        'assets/images/kifuliiru.png',
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Bingi ku Kifuliiru',
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
                                  builder: (context) =>
                                      const KifuliiruNeKiswahili()),
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
                                    child: Icon(Icons.person,
                                        size: 50.0, color: Colors.black87),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                      bottom: 20,
                                      child: Text(
                                        'Migeeza ye\'Kifuliiru',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ]),
                          ),
                        ),
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
                                    child: Icon(
                                      Icons.book_rounded,
                                      size: 50,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Text(
                                      'Ibiyandike mu Kifuliiru',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
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
                                  builder: (context) =>
                                      const KifuliiruNeKifaransa()),
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
                                  builder: (context) =>
                                      const KifuliiruNeKingereza()),
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
          Container(
            decoration: const BoxDecoration(
              color: Colors.white10,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Magambo ge\'Kifuliiru',
                style: TextStyle(
                  fontSize: 20,
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
                                  builder: (context) =>
                                      const KifuliiruNeKiswahili()),
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
                                  builder: (context) =>
                                      const KifuliiruNeKifaransa()),
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
                                  builder: (context) =>
                                      const KifuliiruNeKingereza()),
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
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 350,
            decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
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
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
                            child: Image.asset(
                              'assets/images/kifuliiru.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Flexible(
                            child: Text(
                                'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru.'),
                          ),
                          const SizedBox(
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
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(5),

          children: <Widget>[
            const DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/rdc.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Yongera igambo lihyahya'),
              leading: const Icon(
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
                  MaterialPageRoute(
                      builder: (context) => const GamboLihyahya()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              tileColor: Colors.white,
              title: const Text('Kifuliiru-Kifuliiru'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKifuliiru()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              /*  trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Kifuliiru-Kiswahili'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKiswahili()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.book_rounded,
                color: Colors.blue,
              ),
              tileColor: Colors.white,
              /*  trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Kifuliiru-Kifaransa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKifaransa()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Kifuliiru-Kingereza'),
              hoverColor: Colors.greenAccent.shade700,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KifuliiruNeKingereza()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.list_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Imyazi'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Myazi()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Twehe'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyaziYitu()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.web_rounded, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Namuyehuulo witu'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SiteWebYitu()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.radio, color: Colors.blue),
              /* trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.black,
              ), */
              title: const Text('Radio Ibufuliiru'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadioIbufuliiru()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              trailing: Icon(Icons.dark_mode),
              title: Text('Hindula'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RadioIbufuliiru()));
                break;
              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Myazi()));
                break;
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Chat()));
                break;
            }
          });
        },
      ),
    );
  }
}

class Imyazi {}
