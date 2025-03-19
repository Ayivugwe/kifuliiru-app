import 'package:flutter/material.dart';
import '../../theme.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Vocabulary Practice',
            'Practice your vocabulary skills',
            [
              _buildPracticeCard(
                context,
                'Word Matching',
                'Match Kifuliiru words with their meanings',
                Icons.compare_arrows,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Fill in the Blanks',
                'Complete sentences with correct words',
                Icons.edit_note,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Word Categories',
                'Sort words into correct categories',
                Icons.category,
                () {},
              ),
            ],
          ),
          _buildSection(
            'Grammar Practice',
            'Practice grammar concepts',
            [
              _buildPracticeCard(
                context,
                'Sentence Structure',
                'Arrange words to form correct sentences',
                Icons.format_quote,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Verb Conjugation',
                'Practice verb forms and tenses',
                Icons.auto_awesome,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Noun Classes',
                'Practice noun class agreement',
                Icons.format_list_bulleted,
                () {},
              ),
            ],
          ),
          _buildSection(
            'Pronunciation Practice',
            'Improve your pronunciation',
            [
              _buildPracticeCard(
                context,
                'Sound Recognition',
                'Identify correct sounds and tones',
                Icons.hearing,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Word Stress',
                'Practice word stress patterns',
                Icons.record_voice_over,
                () {},
              ),
              _buildPracticeCard(
                context,
                'Tone Practice',
                'Practice different tones',
                Icons.music_note,
                () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> practices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        ...practices,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPracticeCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: KifuliiruTheme.primaryColor,
                  size: 30,
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
} 