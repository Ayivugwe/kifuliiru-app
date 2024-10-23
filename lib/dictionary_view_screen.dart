// lib/screens/dictionary_view_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kifuliiru_app/igambo2.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
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
  final TextEditingController _searchController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();
  List<Igambo> _filteredWords = [];
  List<Igambo> _allWords = [];
  bool _isLoading = true;
  String? _errorMessage;
  bool isSpeakingDefinition = false;
  // TODO: Add state variables for Kifuliiru audio playback
  // bool isPlayingKifuliiruAudio = false;

  @override
  void initState() {
    super.initState();
    _loadDictionary();
    _initializeTTS();
  }

  void _initializeTTS() async {
    if (_isTTSSupported()) {
      await flutterTts.setLanguage(_getLanguageCode());
      await flutterTts.setSpeechRate(0.5);
      flutterTts.setCompletionHandler(() {
        setState(() => isSpeakingDefinition = false);
      });
    }
  }

  bool _isTTSSupported() {
    return widget.dictionaryType == DictionaryType.english ||
        widget.dictionaryType == DictionaryType.french;
  }

  String _getLanguageCode() {
    switch (widget.dictionaryType) {
      case DictionaryType.english:
        return 'en-US';
      case DictionaryType.french:
        return 'fr-FR';
      default:
        return 'en-US';
    }
  }

  Future<void> _speakDefinition(String text) async {
    if (!_isTTSSupported()) return;

    if (isSpeakingDefinition) {
      await flutterTts.stop();
      setState(() => isSpeakingDefinition = false);
      return;
    }

    setState(() => isSpeakingDefinition = true);
    await flutterTts.speak(text);
  }

  Future<void> _loadDictionary() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final service = DictionaryService();
      final words = await service.fetchDictionary(widget.dictionaryType);
      // Sort words alphabetically by igambo
      words.sort((a, b) => (a.igambo ?? '').compareTo(b.igambo ?? ''));
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
      print('Error loading dictionary: $e');
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
        final wordText = word.igambo?.toLowerCase() ?? '';
        final definitionText = _getDefinitionForLanguage(word).toLowerCase();
        final searchLower = query.toLowerCase();

        return wordText.contains(searchLower) ||
            definitionText.contains(searchLower);
      }).toList();
    });
  }

  String _getTitle() {
    switch (widget.dictionaryType) {
      case DictionaryType.kifuliiru:
        return 'Kifuliiru-Kifuliiru';
      case DictionaryType.kiswahili:
        return 'Kifuliiru-Kiswahili';
      case DictionaryType.french:
        return 'Kifuliiru-Français';
      case DictionaryType.english:
        return 'Kifuliiru-English';
    }
  }

  String _getDefinitionForLanguage(Igambo word) {
    switch (widget.dictionaryType) {
      case DictionaryType.kifuliiru:
        return word.kifuliiru ?? '';
      case DictionaryType.kiswahili:
        return word.kiswahili ?? '';
      case DictionaryType.french:
        return word.kifaransa ?? '';
      case DictionaryType.english:
        return word.kingereza ?? '';
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
        final dateCreated = word.sCreatedDate != null
            ? DateTime.tryParse(word.sCreatedDate!)?.toLocal()
            : null;

        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: ExpansionTile(
            title: Text(
              word.igambo ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              _getDefinitionForLanguage(word),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Full Definition:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getDefinitionForLanguage(word),
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (word.holidesirwi != null &&
                        word.holidesirwi!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Related Words:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        children: word.holidesirwi!
                            .map((related) => Chip(
                                  label: Text(related),
                                  backgroundColor: Colors.blue[50],
                                ))
                            .toList(),
                      ),
                    ],
                    if (dateCreated != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Added: ${dateCreated.toString().split('.')[0]}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    Center(
                      child: TextButton.icon(
                        onPressed: () => _showWordDetails(word),
                        icon: const Icon(Icons.fullscreen),
                        label: const Text('View Full Details'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showWordDetails(Igambo word) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder: (context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            word.igambo ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // TODO: Add Kifuliiru audio button when implemented
                        // if (word.audioUrl != null) IconButton(...)
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Definition:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        if (_isTTSSupported())
                          IconButton(
                            onPressed: () => _speakDefinition(
                                _getDefinitionForLanguage(word)),
                            icon: Icon(
                              isSpeakingDefinition
                                  ? Icons.stop_circle
                                  : Icons.play_circle,
                              color: Colors.blue,
                              size: 28,
                            ),
                            tooltip: isSpeakingDefinition
                                ? 'Stop'
                                : 'Play definition',
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _getDefinitionForLanguage(word),
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (word.holidesirwi != null &&
                        word.holidesirwi!.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Related Words:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: word.holidesirwi!
                            .map((related) => Chip(
                                  label: Text(related),
                                  backgroundColor: Colors.blue[50],
                                ))
                            .toList(),
                      ),
                    ],
                    if (word.sCreatedDate != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        'Added: ${DateTime.parse(word.sCreatedDate!).toLocal().toString().split('.')[0]}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
    flutterTts.stop();
    // TODO: Clean up Kifuliiru audio resources when implemented
    super.dispose();
  }
}
