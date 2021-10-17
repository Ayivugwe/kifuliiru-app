import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class KifuliiruNeKifaransa extends StatefulWidget {
  @override
  _KifuliiruNeKifaransaState createState() => _KifuliiruNeKifaransaState();
}

class _KifuliiruNeKifaransaState extends State<KifuliiruNeKifaransa> {
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
        title: Text('Kifuliiru mu Kifaransa'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Tulonge abagambo ge Kifuliiru mu Kifaransa'),
            FutureBuilder<Igambo>(
              future: amagambo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                    ),
                    title: Text(snapshot.data!.igamboMuKifuliiru),
                    subtitle: Text(snapshot.data!.sobanuuroYalyoMuKifuliiru),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
