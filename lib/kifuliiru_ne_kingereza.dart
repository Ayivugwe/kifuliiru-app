import 'package:flutter/material.dart';
import 'package:kifuliiru_app/igambo.dart';
import 'package:kifuliiru_app/list_magambo.dart';

class KifuliiruNeKingereza extends StatefulWidget {
  const KifuliiruNeKingereza({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKingerezaState createState() => _KifuliiruNeKingerezaState();
}

class _KifuliiruNeKingerezaState extends State<KifuliiruNeKingereza> {
  late Future<List<Igambo>> futureIgambo;

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
        title: 'Kifuliiru - Kingereza',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Magambo ge\'Kifuliiru mu Kingereza'),
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
                            snapshot.data![index].sobaanuroYeKingereza
                                .toString(),
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
