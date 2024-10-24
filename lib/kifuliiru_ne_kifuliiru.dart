// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kifuliiru_app/list_magambo.dart';

import 'models/igambo.dart';
// Import the audioplayers package

class KifuliiruNeKifuliiru extends StatefulWidget {
  const KifuliiruNeKifuliiru({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKifuliiruState createState() => _KifuliiruNeKifuliiruState();
}

class _KifuliiruNeKifuliiruState extends State<KifuliiruNeKifuliiru> {
  late Future<List<Igambo>> futureIgambo;
  List<Igambo> allIgambo = []; // Store the original list
  // Create an instance of AudioPlayer

  @override
  void initState() {
    super.initState();
    MagamboList magamboList = MagamboList();
    futureIgambo = magamboList.fetchIgambo().then((igamboList) {
      allIgambo = igamboList; // Save the original list
      return igamboList; // Return the list for future use
    });
  }

  void _looza(String igamboUmulooza) {
    List<Igambo> results;

    if (igamboUmulooza.isEmpty) {
      results = allIgambo; // Use the original list when search is empty
    } else {
      results = allIgambo
          .where((igambo) => (igambo.title.toLowerCase())
              .contains(igamboUmulooza.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      futureIgambo = Future.value(results); // Update futureIgambo
    });
  }

  // Function to play audi

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
            title: const Text('Kifuliiru - Kifuliiru'),
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
                                              return Container(
                                                width: 400, // Set a fixed width
                                                height:
                                                    300, // Set a fixed height
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 20),
                                                    Text(
                                                      snapshot
                                                          .data![index].title
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(snapshot
                                                        .data![index].sobaanuro
                                                        .toString()),
                                                    const SizedBox(height: 20),
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.play_arrow),
                                                      onPressed: () {
                                                        // Call the play audio function with the audio URL
                                                        // Ensure audioUrl is a property of Igambo
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
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
                                          snapshot.data![index].title
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      subtitle: Text(
                                          snapshot.data![index].sobaanuro
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
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
