import 'dart:io';

import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

class KifuliiruNeKifuliiru extends StatefulWidget {
  const KifuliiruNeKifuliiru({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  // ignore: deprecated_member_use

  late Future<Igambo> amagambo;
  List<Igambo> listeAmagambo = [];
  // ignore: prefer_typing_uninitialized_variables
  var igambo;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    amagambo = fetchAmagambo();
  }

  Future<Igambo> fetchAmagambo() async {
    final response = await http.get(
      Uri.parse(
          'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
      },
    );

    /* final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));
 */
    if (response.statusCode == 200) {
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
        title: const Text('Kifuliiru mu Kifuliiru'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _searchController,
              ),
            ),
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future: amagambo,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    //in case if error found
                    return Center(child: Text("${snapshot.error}"));
                  } else if (snapshot.hasData) {
                    //once data is ready this else block will execute
                    // items will hold all the data of DataModel
                    //items[index].name can be used to fetch name of product as done below

                    return FutureBuilder<Igambo>(
                      future: amagambo,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            title: Text(snapshot.data!.title.toString()),
                            subtitle: Text(snapshot.data!.sobaanuro.toString()),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    );
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
