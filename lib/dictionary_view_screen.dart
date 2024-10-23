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
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDictionary();
  }

  Future<void> _loadDictionary() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final service = DictionaryService();
      final words = await service.fetchDictionary(widget.dictionaryType);
      setState(() {
        _allWords = words;
        _filteredWords = words;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
      print('Error loading dictionary: $e'); // For debugging
    }
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

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        onChanged: _filterWords,
        decoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Enter a word or definition',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error Loading Dictionary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              _errorMessage ?? 'An unknown error occurred',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadDictionary,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordList() {
    if (_filteredWords.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No words found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: _filteredWords.length,
      padding: const EdgeInsets.only(bottom: 16),
      itemBuilder: (context, index) {
        final word = _filteredWords[index];
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: ExpansionTile(
            title: Text(
              word.word,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word.definition,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (word.example != null && word.example!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Example:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        word.example!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    if (word.notes != null && word.notes!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Notes:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        word.notes!,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDictionary,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage != null
                    ? _buildErrorView()
                    : _buildWordList(),
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
