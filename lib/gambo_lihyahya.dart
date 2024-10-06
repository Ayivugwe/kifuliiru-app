import 'package:flutter/material.dart';

class GamboLihyahya extends StatelessWidget {
  const GamboLihyahya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtControllerIgambo = TextEditingController(),
        txtControllerKifuliiru = TextEditingController(),
        txtControllerKiswahili = TextEditingController(),
        txtControllerKifaransa = TextEditingController(),
        txtControllerKingereza = TextEditingController();


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
                      'Yandika ngisi gambo lyo\'yiji mu ndeto ngisi kwo zikulikirini'),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 5,
                    controller: txtControllerIgambo,
                    decoration: InputDecoration(
                      labelText: 'Igambo mu Kifuliiru *',
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
                    controller: txtControllerKifuliiru,
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

                    controller: txtControllerKiswahili,
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
                      controller: txtControllerKifaransa),
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
                      controller: txtControllerKingereza),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        // Add code to save data
                      },
                      child: const Text('Bika bino wayandika'))
                ],
              ),
            ),
          ),
        )));
  }
}
