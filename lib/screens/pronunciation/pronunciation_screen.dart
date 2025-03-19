import 'package:flutter/material.dart';
import '../../theme.dart';

class PronunciationScreen extends StatelessWidget {
  const PronunciationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronunciation'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPronunciationCategory(
            'Vowels',
            'Learn and practice Kifuliiru vowel sounds',
            Icons.record_voice_over,
            () {},
          ),
          _buildPronunciationCategory(
            'Consonants',
            'Master Kifuliiru consonant pronunciations',
            Icons.volume_up,
            () {},
          ),
          _buildPronunciationCategory(
            'Tone Practice',
            'Practice different tones in Kifuliiru',
            Icons.trending_up,
            () {},
          ),
          _buildPronunciationCategory(
            'Common Phrases',
            'Practice pronunciation with common phrases',
            Icons.chat_bubble_outline,
            () {},
          ),
          _buildPronunciationCategory(
            'Word Stress',
            'Learn about word stress patterns',
            Icons.format_quote,
            () {},
          ),
          _buildPronunciationCategory(
            'Interactive Practice',
            'Practice with audio feedback',
            Icons.play_circle_outline,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPronunciationCategory(
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
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
        onTap: onTap,
      ),
    );
  }
} 