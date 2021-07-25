import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class KifuliiruNeKifuliiru extends StatefulWidget {
  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  late Future<Igambo> futureAmagambo;
  // ignore: deprecated_member_use
  var _amagambo;
  var igambo;

  @override
  void initState() {
    super.initState();
    futureAmagambo = fetchAmagambo();
  }

  Future<Igambo> fetchAmagambo() async {
    final response = await http.get(Uri.https('jsonplaceholder.typicode.com',
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Igambo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Twayabirwa ukulonga amagambo');
    }
  }

  @override
  Widget build(BuildContext context) {
    _amagambo.clear();

    return Scaffold(
      body: Center(
        child: FutureBuilder<Igambo>(
          future: futureAmagambo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.igamboMuKifuliiru);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
