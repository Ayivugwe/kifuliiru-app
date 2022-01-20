import 'dart:io';

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:path/path.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

class KifuliiruNeKifuliiru extends StatefulWidget {
  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  // ignore: deprecated_member_use

  late Future<Igambo> amagambo;
  List<Igambo> listeAmagambo = [];
  var igambo;
  TextEditingController _searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    amagambo = fetchAmagambo();
  }

  Future<Igambo> fetchAmagambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));

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
        title: Text('Kifuliiru mu Kifuliiru'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _searchController,
              ),
            ),
            Container(
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
                            title: Text(snapshot.data!.igambo.toString()),
                            subtitle: Text(snapshot.data!.kifuliiru.toString()),
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
