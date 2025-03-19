// Then update the imports in your DictionaryViewScreen:
// lib/screens/dictionary_view_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/services/dictionary_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:kifuliiru_app/models/igambo.dart'; // Update this import
import 'package:kifuliiru_app/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: Text(
            _getTitle(),
            style: const TextStyle(
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

  Widget _buildSearchBar() {
    return Container(
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
        controller: _searchController,
        onChanged: _filterWords,
        decoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Enter a word or definition',
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
    );
  }

  Widget _buildErrorView() {
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: KifuliiruTheme.secondaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              'Error Loading Dictionary',
              style: theme.textTheme.titleLarge?.copyWith(
                color: KifuliiruTheme.textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _errorMessage ?? 'An unknown error occurred',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
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
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No words found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
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
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ExpansionTile(
        title: Text(
          word.title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: KifuliiruTheme.textColor,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          _getDefinitionForLanguage(word),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (word.sobaanuro != null) ...[
                  _buildDefinitionSection(
                    'Kifuliiru',
                    word.sobaanuro!,
                    theme,
                  ),
                  const SizedBox(height: 16),
                ],
                if (word.sobaanuroYeKiswahili != null) ...[
                  _buildDefinitionSection(
                    'Kiswahili',
                    word.sobaanuroYeKiswahili!,
                    theme,
                  ),
                  const SizedBox(height: 16),
                ],
                if (word.sobaanuroYeKifaransa != null) ...[
                  _buildDefinitionSection(
                    'Français',
                    word.sobaanuroYeKifaransa!,
                    theme,
                  ),
                  const SizedBox(height: 16),
                ],
                if (word.sobaanuroYeKingereza != null) ...[
                  _buildDefinitionSection(
                    'English',
                    word.sobaanuroYeKingereza!,
                    theme,
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_isTTSSupported())
                      IconButton(
                        icon: Icon(
                          isSpeakingDefinition
                              ? Icons.stop
                              : Icons.volume_up,
                          color: KifuliiruTheme.primaryColor,
                        ),
                        onPressed: () => _speakDefinition(
                          _getDefinitionForLanguage(word),
                        ),
                      ),
                    IconButton(
                      icon: Icon(
                        Icons.copy,
                        color: KifuliiruTheme.primaryColor,
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                          text: '${word.title}\n${_getDefinitionForLanguage(word)}',
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Copied to clipboard'),
                            backgroundColor: KifuliiruTheme.primaryColor,
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: KifuliiruTheme.primaryColor,
                      ),
                      onPressed: () {
                        Share.share(
                          '${word.title}\n${_getDefinitionForLanguage(word)}',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefinitionSection(
    String language,
    String definition,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          language,
          style: theme.textTheme.titleSmall?.copyWith(
            color: KifuliiruTheme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          definition,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: KifuliiruTheme.textColor,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
