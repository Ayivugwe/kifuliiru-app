// lib/screens/dictionary_screen.dart
import 'package:flutter/material.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';

import 'dictionary_view_screen.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  const DictionaryScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C4356),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF2C4356),
            child: const Text(
              'Choose Dictionary Language',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - Kifuliiru',
                  'Explore words and their meanings in Kifuliiru',
                  Icons.book,
                  Colors.blue,
                  () =>
                      _navigateToDictionary(context, DictionaryType.kifuliiru),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - Kiswahili',
                  'Translate between Kifuliiru and Kiswahili',
                  Icons.translate,
                  Colors.green,
                  () =>
                      _navigateToDictionary(context, DictionaryType.kiswahili),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - Français',
                  'Translate between Kifuliiru and French',
                  Icons.language,
                  Colors.red,
                  () => _navigateToDictionary(context, DictionaryType.french),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - English',
                  'Translate between Kifuliiru and English',
                  Icons.language,
                  Colors.purple,
                  () => _navigateToDictionary(context, DictionaryType.english),
                ),
              ],
            ),
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
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C4356),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDictionary(BuildContext context, DictionaryType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DictionaryViewScreen(
          dictionaryType:
              type, // Fixed: Now properly passing the dictionary type
        ),
      ),
    );
  }
}
