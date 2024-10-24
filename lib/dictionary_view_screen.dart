// Then update the imports in your DictionaryViewScreen:
// lib/screens/dictionary_view_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/services/dictionary_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:kifuliiru_app/models/igambo.dart'; // Update this import

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
  final DictionaryService _dictionaryService = DictionaryService();

  List<Igambo> _allWords = [];
  List<Igambo> _filteredWords = [];
  bool _isLoading = true;
  String? _errorMessage;
  bool isSpeakingDefinition = false;

  @override
  void initState() {
    super.initState();
    _initializeTTS();
    _loadDictionary();
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

  Future<void> _loadDictionary() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response =
          await _dictionaryService.fetchDictionary(widget.dictionaryType);

      setState(() {
        if (response.success && response.items != null) {
          _allWords = response.items!;
          _allWords.sort((a, b) => a.title.compareTo(b.title));
          _filteredWords = List.from(_allWords);
        } else {
          _errorMessage = response.error ?? 'Failed to load dictionary';
        }
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error loading dictionary: $e';
        _isLoading = false;
      });
    }
  }

  void _filterWords(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredWords = List.from(_allWords);
      } else {
        _filteredWords = _allWords.where((word) {
          final titleMatch =
              word.title.toLowerCase().contains(query.toLowerCase());
          final definitionMatch = _getDefinitionForLanguage(word)
              .toLowerCase()
              .contains(query.toLowerCase());
          return titleMatch || definitionMatch;
        }).toList();
      }
      _filteredWords.sort((a, b) => a.title.compareTo(b.title));
    });
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
        return word.sobaanuro ?? '';
      case DictionaryType.kiswahili:
        return word.sobaanuroYeKiswahili ?? '';
      case DictionaryType.french:
        return word.sobaanuroYeKifaransa ?? '';
      case DictionaryType.english:
        return word.sobaanuroYeKingereza ?? '';
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
        return _buildWordCard(word);
      },
    );
  }

  Widget _buildWordCard(Igambo word) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: ExpansionTile(
        title: Text(
          word.title,
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
                if (word.createdDate != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Added: ${DateTime.parse(word.createdDate!).toLocal().toString().split('.')[0]}',
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
  }

  void _showWordDetails(Igambo word) {
    String generateShareText() {
      StringBuffer shareText = StringBuffer();
      shareText.writeln('📚 ${word.title}');
      shareText.writeln('🔤 Definition: ${_getDefinitionForLanguage(word)}');
      if (word.holidesirwi != null && word.holidesirwi!.isNotEmpty) {
        shareText.writeln('\n📎 Related words & phrases:');
        for (var relatedWord in word.holidesirwi!) {
          shareText.writeln('• $relatedWord');
        }
      }
      shareText.writeln('\nShared from Kifuliiru Dictionary App');
      return shareText.toString();
    }

    void shareWord() async {
      try {
        await Share.share(
          generateShareText(),
          subject: 'Check out this word in Kifuliiru!',
        );
      } catch (e) {
        debugPrint('Error sharing: $e');
      }
    }

    void copyToClipboard(BuildContext context, String text) {
      Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }

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
            builder: (context, scrollController) => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.record_voice_over,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Kifuliiru:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Audio Coming Soon'),
                                            content: const Text(
                                              'We are currently working on adding audio pronunciations for Kifuliiru words. This feature will be available in a future update!',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.volume_up,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                    tooltip: 'Play Kifuliiru audio',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                word.title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.menu_book,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
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
                                  if (widget.dictionaryType ==
                                      DictionaryType.kifuliiru)
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Audio Coming Soon'),
                                              content: const Text(
                                                'We are currently working on adding audio pronunciations for Kifuliiru words. This feature will be available in a future update!',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.volume_up,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                      tooltip: 'Play definition audio',
                                    )
                                  else if (_isTTSSupported())
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
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          if (word.holidesirwi != null &&
                              word.holidesirwi!.isNotEmpty) ...[
                            const SizedBox(height: 24),
                            const Row(
                              children: [
                                Icon(
                                  Icons.connect_without_contact,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Related Words & Phrases:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: word.holidesirwi!.length,
                                separatorBuilder: (context, index) => Divider(
                                  height: 1,
                                  color: Colors.grey[300],
                                ),
                                itemBuilder: (context, index) {
                                  final relatedWord = word.holidesirwi![index];
                                  return InkWell(
                                    onTap: () {
                                      // Find and show the related word if it exists in dictionary
                                      final relatedWordEntry =
                                          _allWords.firstWhere(
                                        (w) =>
                                            w.title.toLowerCase() ==
                                            relatedWord.toLowerCase(),
                                        orElse: () => word,
                                      );
                                      if (relatedWordEntry != word) {
                                        Navigator.pop(context);
                                        _showWordDetails(relatedWordEntry);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                        horizontal: 16.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '•',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              relatedWord,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                height: 1.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                          if (word.createdDate != null) ...[
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Added: ${DateTime.parse(word.createdDate!).toLocal().toString().split('.')[0]}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () =>
                            copyToClipboard(context, generateShareText()),
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.blue,
                          size: 28,
                        ),
                        tooltip: 'Copy to clipboard',
                      ),
                      IconButton(
                        onPressed: shareWord,
                        icon: const Icon(
                          Icons.share,
                          color: Colors.blue,
                          size: 28,
                        ),
                        tooltip: 'Share Word',
                      ),
                    ],
                  ),
                ),
              ],
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
    super.dispose();
  }
}
