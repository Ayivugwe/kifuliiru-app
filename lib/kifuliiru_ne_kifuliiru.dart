import 'package:flutter/material.dart';
import 'igambo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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

  void displayBottomSheet(BuildContext context, int index) {
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return Container(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                  )),
              height: 600.0, //MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        _amagambo[index].igamboMuKifuliiru,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        _amagambo[index].sobanuuroYalyo,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: InkWell(
                          splashColor: Colors.green, // splash color
                          onTap: () {}, // button pressed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.volume_up), // icon
                              Text("Yuvwa izu"), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
