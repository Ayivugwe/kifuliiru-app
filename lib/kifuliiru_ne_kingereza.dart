import 'package:flutter/material.dart';
import 'package:kifuliiru_app/igambo.dart';
import 'package:kifuliiru_app/list_magambo.dart';

class KifuliiruNeKingereza extends StatefulWidget {
  const KifuliiruNeKingereza({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KifuliiruNeKingerezaState createState() => _KifuliiruNeKingerezaState();
}

class _KifuliiruNeKingerezaState extends State<KifuliiruNeKingereza> {
  late Future<List<Igambo>> futureIgambo;

  // This function is called whenever the text field changes
  void _looza(String igamboUmulooza) {
    List<Map<String, dynamic>> results = [];
    if (igamboUmulooza.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = futureIgambo as List<Map<String, dynamic>>;
    } else {
      results = futureIgambo as List<Map<String, dynamic>>;
      results = results
          .where((igambo) =>
              igambo["igambo"]
                  .toLowerCase()
                  .contains(igamboUmulooza.toLowerCase()) ||
              igambo["sobaanuro"]
                  .toLowerCase()
                  .contains(igamboUmulooza.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      //maga = results;
    });
  }

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
            title: const Text('Kifuliiru - Kingereza'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) => _looza(value),
                    decoration: const InputDecoration(
                        labelText: 'Looza hano ... ',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder<List<Igambo>>(
                      future: futureIgambo,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Card(
                                    child: ListTile(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            isDismissible: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          20.0)),
                                            ),
                                            builder: (context) {
                                              return Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: FractionallySizedBox(
                                                      heightFactor: 0.5,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .igambo
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(snapshot
                                                              .data![index]
                                                              .kingereza
                                                              .toString()),
                                                        ],
                                                      )));
                                            });
                                      },
                                      hoverColor: Colors.blue,
                                      leading: const CircleAvatar(
                                        radius: 37,
                                        backgroundColor: Colors.blue,
                                        child: CircleAvatar(
                                          radius: 33,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.book,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                          snapshot.data![index].igambo
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      subtitle: Text(
                                          snapshot.data![index].kingereza
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54)),
                                    ),
                                  ));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
