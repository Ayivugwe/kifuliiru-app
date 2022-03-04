// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'Umwazi.dart';

class Myazi extends StatefulWidget {
  const Myazi({Key? key}) : super(key: key);

  @override
  _MyaziState createState() => _MyaziState();
}

class _MyaziState extends State<Myazi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Myazi mu Kifuliiru'),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Umwazi(
                              title: 'Guno guliri mwazi mu Kifuliiru',
                            )),
                  )
                },
                child: SizedBox(
                  height: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/rdc.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 50,
                        child: Text(
                          'Itwe lyo\'mwazi Umwazi mu Kifuliiru ndeto yitu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Text(
                            'Tulonge imyazi yo\'buhinga buhyahya, imitukari, ne\'gindi yooshi mu Kifuliiru. Tumenye\'myazi ye\'Bufuliiru : tumenye byoshi bye\'mwitu. Ibufuliiru. Radio Ibufuliiru ikabutwa kushaga mu mukolwa Ibufuliiru kandi li Tumenye Ibufuliiru mukuloza ukugwasa abandu basime bwnene Kifuliiru na bagenderere ukukizi kiyuvwa mu magambo go bulyo bwingi. Guno mukolwa gukashaga mu nzaliro zo mwana we Bufuliiru na Mugfuliiru :  Ayivugwe Kabemba Mukome.'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
