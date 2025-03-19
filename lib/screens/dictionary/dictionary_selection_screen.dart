import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../models/dictionary_type.dart';
import 'dictionary_view_screen.dart';

class DictionarySelectionScreen extends StatelessWidget {
  const DictionarySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Dictionary'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDictionaryOption(
            context,
            'Kifuliiru - Kifuliiru',
            'Search words in Kifuliiru with Kifuliiru definitions',
            Icons.book,
            DictionaryType.kifuliiru,
          ),
          _buildDictionaryOption(
            context,
            'Kifuliiru - Kiswahili',
            'Search Kifuliiru words with Kiswahili translations',
            Icons.translate,
            DictionaryType.kiswahili,
          ),
          _buildDictionaryOption(
            context,
            'Kifuliiru - French',
            'Search Kifuliiru words with French translations',
            Icons.translate,
            DictionaryType.french,
          ),
          _buildDictionaryOption(
            context,
            'Kifuliiru - English',
            'Search Kifuliiru words with English translations',
            Icons.translate,
            DictionaryType.english,
          ),
        ],
      ),
    );
  }

  Widget _buildDictionaryOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    DictionaryType type,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: KifuliiruTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: KifuliiruTheme.primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DictionaryViewScreen(type: type),
            ),
          );
        },
      ),
    );
  }
} 