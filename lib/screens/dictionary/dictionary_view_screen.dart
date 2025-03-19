import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../models/dictionary_type.dart';
import '../../widgets/custom_bottom_sheet.dart';

class DictionaryViewScreen extends StatelessWidget {
  final DictionaryType type;

  const DictionaryViewScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search words...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 20, // Placeholder count
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text('Word ${index + 1}'),
                    subtitle: Text('Translation ${index + 1}'),
                    onTap: () => _showWordDetails(context, index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showWordDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: 'Word ${index + 1}',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoCard(
              'Definition',
              'This is a detailed definition of the word in Kifuliiru.',
            ),
            _buildInfoCard(
              'Example',
              'This is an example sentence using the word.',
            ),
            _buildInfoCard(
              'Category',
              'Noun',
            ),
            _buildInfoCard(
              'Related Words',
              'Related word 1, Related word 2',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (type) {
      case DictionaryType.kifuliiru:
        return 'Kifuliiru Dictionary';
      case DictionaryType.kiswahili:
        return 'Kifuliiru - Kiswahili';
      case DictionaryType.french:
        return 'Kifuliiru - French';
      case DictionaryType.english:
        return 'Kifuliiru - English';
    }
  }
} 