import 'package:flutter/material.dart';
import '../../theme.dart';
import 'nouns_screen.dart';
import 'verbs_screen.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammar Rules'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildGrammarCategory(
            'Nouns',
            'Learn about Kifuliiru nouns and their classifications',
            Icons.category,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NounsScreen()),
            ),
          ),
          _buildGrammarCategory(
            'Verbs',
            'Understanding Kifuliiru verb tenses and conjugations',
            Icons.auto_awesome,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VerbsScreen()),
            ),
          ),
          _buildGrammarCategory(
            'Adjectives',
            'Using adjectives to describe nouns in Kifuliiru',
            Icons.format_color_text,
            () {},
          ),
          _buildGrammarCategory(
            'Pronouns',
            'Personal and possessive pronouns in Kifuliiru',
            Icons.person,
            () {},
          ),
          _buildGrammarCategory(
            'Sentence Structure',
            'Basic and complex sentence patterns',
            Icons.format_align_left,
            () {},
          ),
          _buildGrammarCategory(
            'Tenses',
            'Understanding different tenses in Kifuliiru',
            Icons.access_time,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildGrammarCategory(
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