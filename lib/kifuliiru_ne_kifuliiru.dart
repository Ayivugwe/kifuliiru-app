import 'package:flutter/material.dart';
import 'package:kifuliiru_app/igambo.dart';
import 'package:kifuliiru_app/list_magambo.dart';

class KifuliiruNeKifuliiru extends StatefulWidget {
  const KifuliiruNeKifuliiru({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  late Future<List<Igambo>> futureIgambo;

  /* //get data from local json file
  Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse('assets/database/magambo.json'));

    if (response.statusCode == 200) {
      return parseIgambo(response.body);
    } else {
      throw Exception('Failed to load igambo');
    }
  } */
/* 
  //pass json file to the list
  List<Igambo> parseIgambo(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Igambo>((json) => Igambo.fromJson(json)).toList();
  } */

  @override
  void initState() {
    MagamboList magamboList = MagamboList();
    super.initState();
    futureIgambo = magamboList.fetchIgambo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kifuliiru - Kifuliiru',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Magambo ge\'Kifuliiru mu Kifuliiru'),
          ),
          body: Center(
            child: FutureBuilder<List<Igambo>>(
                future: futureIgambo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(snapshot.data![index].title.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text(
                            snapshot.data![index].sobaanuro.toString(),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
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
