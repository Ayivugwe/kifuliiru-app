// lib/screens/dictionary_view_screen.dart
import 'package:flutter/material.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/models/igambo.dart';
import 'package:kifuliiru_app/services/dictionary_service.dart';

class DictionaryViewScreen extends StatefulWidget {
  final DictionaryType dictionaryType;

  const DictionaryViewScreen({
    Key? key,
    required this.dictionaryType,
  }) : super(key: key);

  @override
  State<DictionaryViewScreen> createState() => _DictionaryViewScreenState();
}

class _DictionaryViewScreenState extends State<DictionaryViewScreen> {
  late Future<List<Igambo>> _dictionaryFuture;
  final TextEditingController _searchController = TextEditingController();
  List<Igambo> _filteredWords = [];
  List<Igambo> _allWords = [];

  @override
  void initState() {
    super.initState();
    _dictionaryFuture = _loadDictionary();
  }

  Future<List<Igambo>> _loadDictionary() async {
    final service = DictionaryService();
    final words = await service.fetchDictionary(widget.dictionaryType);
    _allWords = words;
    _filteredWords = words;
    return words;
  }

  void _filterWords(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredWords = _allWords;
      });
      return;
    }

    setState(() {
      _filteredWords = _allWords.where((word) {
        final wordLower = word.word.toLowerCase();
        final definitionLower = word.definition.toLowerCase();
        final searchLower = query.toLowerCase();

        return wordLower.contains(searchLower) ||
            definitionLower.contains(searchLower);
      }).toList();
    });
  }

  String _getTitle() {
    switch (widget.dictionaryType) {
      case DictionaryType.kifuliiru:
        return 'Kifuliiru Dictionary';
      case DictionaryType.kiswahili:
        return 'Kiswahili Dictionary';
      case DictionaryType.french:
        return 'French Dictionary';
      case DictionaryType.english:
        return 'English Dictionary';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterWords,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Igambo>>(
              future: _dictionaryFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                return ListView.builder(
                  itemCount: _filteredWords.length,
                  itemBuilder: (context, index) {
                    final word = _filteredWords[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: ListTile(
                        title: Text(word.word),
                        subtitle: Text(word.definition),
                        onTap: () {
                          // Handle word selection
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
