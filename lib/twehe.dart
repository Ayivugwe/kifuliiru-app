// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class MyaziYitu extends StatelessWidget {
  const MyaziYitu({Key? key}) : super(key: key);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Menya bingi higulu lya guno mukolwa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Tumenye Ibufuliiru imwa Bafuliiru ne Kifuliiru. Ibufuliiru yo\'mwiitu, bo bugale bwiitu. Tumenye na\'handi hoshi. Tumenyeese na\'bandi boshi hoshi bangaba baliri higulu lye\'Bufuliiru. Guno mukolwa guliri hano higulu lyo\'kudeta kwo tumenenye bwija imwitu, abandu biitu ne\' ndeto yiitu Kifuliiru. Tubanini tumenye na\'handi hoshi.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
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
