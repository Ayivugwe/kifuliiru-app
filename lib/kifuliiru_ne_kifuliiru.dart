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
  var amagambo = [];
  var igambo;

  @override
  void initState() {
    super.initState();
    futureAmagambo = fetchAmagambo();
  }

  fetchAmagambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      setState(() {
        return amagambo = jsonDecode(response.body);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      setState(() {
        amagambo = [];
      });
      throw Exception('Twayabirwa ukulonga amagambo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: amagambo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(amagambo[index]['title']),
            subtitle: Text(amagambo[index]['']),
          );
        },
      )),
    );
  }
}
