import 'package:flutter/material.dart';
import 'igambo.dart';

class GamboLihyahya extends StatelessWidget {
  const GamboLihyahya({Key? key}) : super(key: key);

  get database => null;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext ctxt) {
    final txtControllerKifuliiru = TextEditingController(),
        txtControllerKifuliiruKifuliiru = TextEditingController(),
        txtControllerKifuliiruKiswahili = TextEditingController(),
        txtControllerKifuliiruKifaransa = TextEditingController(),
        txtControllerKifuliiruKingereza = TextEditingController();

    Igambo igambo;
    List<Igambo> listeMagmbo = [];
    String gamboMuKifuliiru,
        gamboKifuliiruKifuliiru,
        gamboKifuliiruKiswahili,
        gamboKifuliiruKifaransa,
        gamboKifuliiruKingereza;

    //['Kifuliiru', 'Kiswahili', 'Kifaransa', 'Kingereza']

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Bika igambo lihyahya",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
            
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                      'Yandika ngisi gambo lyo\'yiji mu ndeto ngisi kwo zikulirikirini'),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    controller: txtControllerKifuliiru,
                    decoration: InputDecoration(
                      labelText: 'Igambo mu Kifuliiru*',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    autocorrect: false,
                    //expands: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      labelText: 'Mu Kifuliiru *',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                          width: 1.0,
                        ),
                      ),
                    ),
                    controller: txtControllerKifuliiruKifuliiru,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    autocorrect: false,
                    //expands: true,
                    decoration: InputDecoration(
                      labelText: 'Mu Kiswahili',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                          width: 1.0,
                        ),
                      ),
                    ),
                    showCursor: true,

                    controller: txtControllerKifuliiruKiswahili,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 5,
                      autocorrect: false,
                      //expands: true,
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: 'Mu Kifaransa',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 1.0,
                          ),
                        ),
                      ),
                      controller: txtControllerKifuliiruKifaransa),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: 5,
                      autocorrect: false,
                      //expands: true,
                      showCursor: true,
                      decoration: InputDecoration(
                        labelText: 'Mu Kingereza',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 1.0,
                          ),
                        ),
                      ),
                      controller: txtControllerKifuliiruKingereza),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        gamboMuKifuliiru = txtControllerKifuliiru.text;
                        gamboKifuliiruKifuliiru =
                            txtControllerKifuliiruKifuliiru.text;
                        gamboKifuliiruKiswahili =
                            txtControllerKifuliiruKiswahili.text;
                        gamboKifuliiruKifaransa =
                            txtControllerKifuliiruKifaransa.text;
                        gamboKifuliiruKingereza =
                            txtControllerKifuliiruKingereza.text;

                        igambo = Igambo(
                            igambo: gamboMuKifuliiru,
                            kifuliiru: gamboKifuliiruKifuliiru,
                            kiswahili: gamboKifuliiruKiswahili,
                            kifaransa: gamboKifuliiruKifaransa,
                            kingereza: gamboKifuliiruKingereza);

                        insertData(
                            gamboMuKifuliiru,
                            gamboKifuliiruKifuliiru,
                            gamboKifuliiruKiswahili,
                            gamboKifuliiruKifaransa,
                            gamboKifuliiruKingereza);

                        listeMagmbo.add(igambo);

                        // Close the database
                        await database.close();
                      },
                      child: const Text('Bika'))
                ],
              ),
            ),
          ),
        )));
  }

  insertData(
      String kifuliiru,
      String kifuliiruKifuliiru,
      String kifuliiruKiswahili,
      String kifuliiruKifaransa,
      String kifuliiruKingereza) async {}

  updateData(int id, String kifuliiru, String kifKif, String kifKiswah,
      String kifKifar, String kifKinge) async {}

  getRecords() async {
// Get the records
    List<Map> list =
        await database.rawQuery('SELECT * FROM Magambo_ge_Kifuliiru');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    //assert(const DeepCollectionEquality().equals(list, expectedList));
  }

  countValue() async {
    // Count the records
  }

  deleteData() async {
// Delete a record
  }
}
