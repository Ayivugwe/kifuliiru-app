// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Twehe extends StatelessWidget {
  const Twehe({Key? key}) : super(key: key);
  final title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.green,
          child: const Text('Myazi yitu hano'),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Menya bingi higulu lya guno mukolwa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
