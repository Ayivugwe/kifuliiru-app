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
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: const Text('Magambo ge\'Kifuliiru mu Kifuliiru'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
          body: Center(
            child: FutureBuilder<List<Igambo>>(
                future: futureIgambo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Card(
                              child: ListTile(
                                hoverColor: Colors.blue,
                                leading: const CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 33,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.abc,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                title: Text(
                                    snapshot.data![index].title.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                subtitle: Text(
                                    snapshot.data![index].sobaanuro.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54)),
                              ),
                            ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
  }
}
