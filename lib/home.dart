import 'package:flutter/material.dart';
import 'package:kifuliiru_app/imigani.dart';
import 'package:kifuliiru_app/kifuliiru.dart';
import 'package:kifuliiru_app/news_screen.dart';
import 'package:kifuliiru_app/settings.dart';
import 'package:kifuliiru_app/twehe.dart';
import 'ibiyandike_mu_kifuliiru.dart';
import 'migeeza_ye_kifuliiru.dart';
import 'radio_ibufuliiru.dart';
import 'gambo_lihyahya.dart';
import 'imyazi.dart';
import 'site_web_yitu.dart';
import 'kifuliiru_ne_kifuliiru.dart';
import 'kifuliiru_ne_kifaransa.dart';
import 'kifuliiru_ne_kingereza.dart';
import 'kifuliiru_ne_kiswahili.dart';
import 'chat.dart';



class Home extends StatelessWidget {
  final appTitle = 'KIFULIIRU NDETO YITU';

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
  // ignore: library_private_types_in_public_api
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
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
          'KIFULIIRU NDETO YITU',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        //backgroundColor: HexColor('#f2d7d5'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.red[100],
      body: Center(
        child: ListView(children: [
          // const SizedBox(
          //   height: 400.0,
          //   child: CarouselImyazi(),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
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
                'Muyegerere tumenye bingi ku Kifuliiru mu Kifuliiru',
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
                                  builder: (context) => const Kifuliiru()),
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
                            child: const Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
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
                                      const MigeezaYeKifuliiru()),
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
                            child: const Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
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
                                      'Migeeza ye\'Kifuliiru',
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
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
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
                                builder: (context) => const Imigani()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white54,
                          ),
                          child: const Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
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
                                    'Migani ye\'Kifuliiru',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const IbiyandikeMuKifuliiru()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white54,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ibiyandike mu Kifuliiru',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                              image: AssetImage('assets/images/kifuliiru.png'),
                              height: 257,
                              width: 400,
                              fit: BoxFit.fill),
                        ],
                      ),
                    ),
                  ),
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
                            child: const Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
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
                            child: const Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
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
                            child: const Stack(
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
                            child: const Stack(
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
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(5),

          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/rdc.png"),
                    fit: BoxFit.cover),
              ),
              child: Text(''),
            ),
            const Divider(),
            ListTile(
              title: const Text('Yongera igambo lihyahya'),
              leading: const Icon(
                Icons.add,
              ),
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
                  MaterialPageRoute(builder: (context) => const Imyazi()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.blue),
              title: const Text('Twehe'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Twehe()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.web_rounded, color: Colors.blue),
              title: const Text('Namuyehuulo witu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SiteWebYitu()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.radio, color: Colors.blue),
              title: const Text('Radio Ibufuliiru'),
              onTap: () {
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
                    MaterialPageRoute(builder: (context) => const Imyazi()));
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
