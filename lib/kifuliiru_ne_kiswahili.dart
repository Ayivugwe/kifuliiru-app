import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class KifuliiruNeKiswahili extends StatefulWidget {
  @override
  _KifuliiruNeKiswahiliState createState() => _KifuliiruNeKiswahiliState();
}

class _KifuliiruNeKiswahiliState extends State<KifuliiruNeKiswahili> {
  // ignore: deprecated_member_use

  late Future<Igambo> amagambo;
  var igambo;

  @override
  void initState() {
    super.initState();
    amagambo = fetchAmagambo();

    print(amagambo);
  }

  Future<Igambo> fetchAmagambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return Igambo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Twayabirwa ukulonga amagambo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kifuliiru mu Kiswahili'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Tulonge abagambo ge Kifuliiru mu Kiswahili'),
            Card(
              child: FutureBuilder(
                future: amagambo,
                builder: (context, data) {
                  if (data.hasError) {
                    //in case if error found
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    //once data is ready this else block will execute
                    // items will hold all the data of DataModel
                    //items[index].name can be used to fetch name of product as done below
                    var items = data.data as List<Igambo>;
                    print('items length ' +
                        items.length.toString() +
                        ' elements ' +
                        items.toString());
                    return ListView.builder(
                        // ignore: unnecessary_null_comparison
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Text(
                                      items[index].title.toString(),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(
                                            items[index].sobaanuro.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(items[index]
                                              .sobaanuroYeKiswahili
                                              .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(items[index]
                                              .sobaanuroYeKifaransa
                                              .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Text(items[index]
                                              .sobaanuroYeKingereza
                                              .toString()),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    // show circular progress while data is getting fetched from json file
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
