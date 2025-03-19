import 'package:flutter/material.dart';
import 'package:kifuliiru_app/list_magambo.dart';
import 'package:kifuliiru_app/models/igambo.dart';
import 'package:kifuliiru_app/theme.dart';

class KifuliiruNeKiswahili extends StatefulWidget {
  const KifuliiruNeKiswahili({Key? key}) : super(key: key);

  @override
  _KifuliiruNeKiswahiliState createState() => _KifuliiruNeKiswahiliState();
}

class _KifuliiruNeKiswahiliState extends State<KifuliiruNeKiswahili> {
  late Future<List<Igambo>> futureIgambo;
  List<Igambo> allIgambo = [];

  @override
  void initState() {
    super.initState();
    MagamboList magamboList = MagamboList();
    futureIgambo = magamboList.fetchIgambo().then((igamboList) {
      allIgambo = igamboList;
      return igamboList;
    });
  }

  void _looza(String igamboUmulooza) {
    List<Igambo> results;

    if (igamboUmulooza.isEmpty) {
      results = allIgambo;
    } else {
      results = allIgambo
          .where((igambo) => (igambo.title.toLowerCase())
              .contains(igamboUmulooza.toLowerCase()))
          .toList();
    }

    setState(() {
      futureIgambo = Future.value(results);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: const Text(
            'Kifuliiru - Kiswahili',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) => _looza(value),
              decoration: InputDecoration(
                labelText: 'Looza hano ...',
                hintText: 'Search for a word',
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: KifuliiruTheme.primaryColor),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Igambo>>(
              future: futureIgambo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FractionallySizedBox(
                                  heightFactor: 0.5,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].title.toString(),
                                        style: theme.textTheme.titleLarge?.copyWith(
                                          color: KifuliiruTheme.textColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        snapshot.data![index].sobaanuroYeKiswahili.toString(),
                                        style: theme.textTheme.bodyLarge?.copyWith(
                                          color: Colors.grey[600],
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.book,
                            color: KifuliiruTheme.primaryColor,
                            size: 24,
                          ),
                        ),
                        title: Text(
                          snapshot.data![index].title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: KifuliiruTheme.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data![index].sobaanuroYeKiswahili.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
