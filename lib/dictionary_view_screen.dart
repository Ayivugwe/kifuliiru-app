import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/services/dictionary_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

import 'igambo.dart';

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
  final ScrollController _scrollController = ScrollController();

  List<Igambo> _words = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  String? _errorMessage;
  bool isSpeakingDefinition = false;

  int _currentPage = 1;
  bool _hasNextPage = true;
  String? _currentSearchQuery;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _initializeTTS();
    _loadDictionary();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.8 &&
          !_isLoadingMore &&
          _hasNextPage) {
        _loadMoreWords();
      }
    });
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

  Future<void> _loadDictionary({String? searchQuery}) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _currentPage = 1;
      _currentSearchQuery = searchQuery;
    });

    try {
      final service = DictionaryService();
      final response = await service.fetchDictionary(
        widget.dictionaryType,
        page: _currentPage,
        pageSize: _pageSize,
        searchQuery: searchQuery,
      );

      setState(() {
        _words = response.items;
        _hasNextPage = response.hasNextPage;
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

  Future<void> _loadMoreWords() async {
    if (_isLoadingMore || !_hasNextPage) return;

    setState(() => _isLoadingMore = true);

    try {
      final service = DictionaryService();
      final response = await service.fetchDictionary(
        widget.dictionaryType,
        page: _currentPage + 1,
        pageSize: _pageSize,
        searchQuery: _currentSearchQuery,
      );

      setState(() {
        _words.addAll(response.items);
        _hasNextPage = response.hasNextPage;
        _currentPage++;
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
        // Optionally show an error snackbar here
      });
      print('Error loading more words: $e');
    }
  }

  void _onSearchChanged(String query) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      _loadDictionary(searchQuery: query);
    });
  }

  Timer? _searchDebounce;

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
        onChanged: _onSearchChanged,
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
              onPressed: () =>
                  _loadDictionary(searchQuery: _currentSearchQuery),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordList() {
    if (_words.isEmpty && !_isLoading) {
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
      controller: _scrollController,
      itemCount: _words.length + (_hasNextPage ? 1 : 0),
      padding: const EdgeInsets.only(bottom: 16),
      itemBuilder: (context, index) {
        if (index == _words.length) {
          return _buildLoadingIndicator();
        }

        final word = _words[index];
        return _buildWordCard(word);
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildWordCard(Igambo word) {
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
  }

  void _showWordDetails(Igambo word) {
    // Function to generate shareable text
    String generateShareText() {
      StringBuffer shareText = StringBuffer();
      shareText.writeln('📚 ${word.igambo}');
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

    // Function to handle sharing
    void shareWord() async {
      try {
        await Share.share(
          generateShareText(),
          subject: 'Check out this word in Kifuliiru!',
        );
      } catch (e) {
        print('Error sharing: $e');
      }
    }

    // Function to handle copying to clipboard
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
                          // Drag Handle
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

                          // Kifuliiru Word Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title row with label and icon
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
                                  // Kifuliiru audio button
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
                              // Word text
                              Text(
                                word.igambo ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Definition Section
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
                                    // Show Kifuliiru audio button for Kifuliiru dictionary
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
                                    // Show TTS button for French and English dictionaries
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

                          // Related Words Section
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
                                      // Optional: Navigate to the word's detail if it exists in dictionary
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

                          // Creation Date Section
                          if (word.sCreatedDate != null) ...[
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
                                    'Added: ${DateTime.parse(word.sCreatedDate!).toLocal().toString().split('.')[0]}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          // Bottom padding for share/copy buttons
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                // Share and Copy icons container at bottom
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
                      // Copy button
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
                      // Share button
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
            onPressed: () => _loadDictionary(searchQuery: _currentSearchQuery),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _isLoading && _words.isEmpty
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
    _scrollController.dispose();
    _searchDebounce?.cancel();
    flutterTts.stop();
    super.dispose();
  }
}
