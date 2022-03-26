import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kifuliiru_app/igambo.dart';

class KifuliiruNeKifuliiru extends StatefulWidget {
  const KifuliiruNeKifuliiru({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  late Future<List<Igambo>> futureIgambo;

  Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'
        //'https://retoolapi.dev/bibawy/data'

        ));
    if (response.statusCode == 200) {
      /* final parsed =
          json.decode(response.body)['items'].cast<Map<String, dynamic>>();
 */
      List<Igambo> parsed = (json.decode(response.body)['items'] as List)
          .map((data) => Igambo.fromJson(data))
          .toList();

      return parsed;
    } else {
      throw Exception('Twayabirwa ukuleta amagambo.');
    }
  }

  @override
  void initState() {
    super.initState();
    futureIgambo = fetchIgambo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kifuliiru - Kifuliiru',
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Kifuliiru - Kifuliiru'),
          ),
          body: Center(
            child: /* ListView.builder(
              itemCount: listAmagambo.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(listAmagambo[i].title.toString()),
                  subtitle: Text(listAmagambo[i].sobaanuro.toString()),
                  onTap: () {},
                );
              }),
        ), */

                FutureBuilder<List<Igambo>>(
                    future: futureIgambo,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => ListTile(
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle: Text(
                                snapshot.data![index].sobaanuro.toString()),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
          ),
        ));
  }
}
