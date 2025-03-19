// lib/screens/dictionary_screen.dart
import 'package:flutter/material.dart';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/theme.dart';
import 'dictionary_view_screen.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  const DictionaryScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

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
            title,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
            child: Text(
              'Choose Dictionary Language',
              style: theme.textTheme.titleMedium?.copyWith(
                color: KifuliiruTheme.textColor,
                fontWeight: FontWeight.w600,
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
                  KifuliiruTheme.primaryColor,
                  () => _navigateToDictionary(context, DictionaryType.kifuliiru),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - Kiswahili',
                  'Translate between Kifuliiru and Kiswahili',
                  Icons.translate,
                  KifuliiruTheme.secondaryColor,
                  () => _navigateToDictionary(context, DictionaryType.kiswahili),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - Français',
                  'Translate between Kifuliiru and French',
                  Icons.language,
                  KifuliiruTheme.primaryColor,
                  () => _navigateToDictionary(context, DictionaryType.french),
                ),
                const SizedBox(height: 16),
                _buildDictionaryOption(
                  context,
                  'Kifuliiru - English',
                  'Translate between Kifuliiru and English',
                  Icons.language,
                  KifuliiruTheme.secondaryColor,
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
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
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
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: KifuliiruTheme.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
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
          dictionaryType: type,
        ),
      ),
    );
  }
}
