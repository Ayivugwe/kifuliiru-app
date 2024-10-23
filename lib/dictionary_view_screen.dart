// dictionary_view_screen.dart
import 'package:flutter/material.dart';
import 'package:kifuliiru_app/amagambo.dart';
import 'package:kifuliiru_app/dictionary_service';

import 'igambo.dart';

class DictionaryViewScreen extends StatefulWidget {
  final DictionaryType type;
  final String title;

  const DictionaryViewScreen({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  @override
  State<DictionaryViewScreen> createState() => _DictionaryViewScreenState();
}

class _DictionaryViewScreenState extends State<DictionaryViewScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';
  late Future<List<Igambo>> _futureDictionary;
  List<Igambo> _allWords = [];
  final DictionaryService _dictionaryService = DictionaryService();

  @override
  void initState() {
    super.initState();
    _loadDictionary();
  }

  void _loadDictionary() {
    _futureDictionary =
        _dictionaryService.fetchDictionary(widget.type).then((words) {
      _allWords = words;
      return words;
    });
  }

  List<Igambo> _getFilteredWords() {
    if (_searchQuery.isEmpty) {
      return _allWords;
    }
    return _allWords.where((word) {
      final searchLower = _searchQuery.toLowerCase();
      final wordLower = word.igambo?.toLowerCase() ?? '';
      final translationLower = _getTranslation(word)?.toLowerCase() ?? '';

      return wordLower.contains(searchLower) ||
          translationLower.contains(searchLower);
    }).toList();
  }

  String? _getTranslation(Igambo word) {
    switch (widget.type) {
      case DictionaryType.kiswahili:
        return word.kiswahili;
      case DictionaryType.french:
        return word.kifaransa;
      case DictionaryType.english:
        return word.kingereza;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              backgroundColor: const Color(0xFF2C4356),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search words...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.white70),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear,
                                  color: Colors.white70),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: FutureBuilder<List<Igambo>>(
          future: _futureDictionary,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No words found'),
              );
            }

            final filteredWords = _getFilteredWords();

            if (filteredWords.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No words found matching "$_searchQuery"',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: filteredWords.length,
              itemBuilder: (context, index) {
                final word = filteredWords[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    onTap: () => _showWordDetails(word),
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF2C4356),
                      child: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      word.igambo ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C4356),
                      ),
                    ),
                    subtitle: Text(
                      _getTranslation(word) ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: const Color(0xFF2C4356),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  void _showWordDetails(Igambo word) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: controller,
            padding: const EdgeInsets.all(24),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                word.igambo ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // if (word.phonetic != null) ...[
              //   Text(
              //     //word.phonetic!,
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Colors.grey[600],
              //       fontStyle: FontStyle.italic,
              //     ),
              //   ),
              //   const SizedBox(height: 16),
              // ],
              if (_getTranslation(word) != null)
                Text(
                  _getTranslation(word)!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              if (word.holidesirwi?.isNotEmpty ?? false) ...[
                const SizedBox(height: 24),
                const Text(
                  'Examples:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...word.holidesirwi!.map((example) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '• $example',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )),
              ],
              //   if (word.synonyms?.isNotEmpty ?? false) ...[
              //     const SizedBox(height: 24),
              //     const Text(
              //       'Synonyms:',
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(height: 8),
              //     Wrap(
              //       spacing: 8,
              //       runSpacing: 8,
              //       children: word.synonyms!
              //           .map((synonym) => Chip(
              //                 label: Text(synonym),
              //               ))
              //           .toList(),
              //     ),
              //   ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
