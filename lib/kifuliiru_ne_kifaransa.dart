import 'package:flutter/material.dart';
import 'package:kifuliiru_app/igambo.dart';
import 'package:kifuliiru_app/list_magambo.dart';

class KifuliiruNeKifaransa extends StatefulWidget {
  const KifuliiruNeKifaransa({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKifaransaState createState() => _KifuliiruNeKifaransaState();
}

class _KifuliiruNeKifaransaState extends State<KifuliiruNeKifaransa> {
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
        title: 'Kifuliiru - Kifaransa',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Magambo ge\'Kifuliiru mu Kifaransa'),
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
                            snapshot.data![index].sobaanuroYeKifaransa
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
