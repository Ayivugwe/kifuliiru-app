import 'package:flutter/material.dart';
import '../../theme.dart';

class VerbsScreen extends StatelessWidget {
  const VerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verbs'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Verb Tenses',
            'Learn about different tenses in Kifuliiru',
            [
              _buildExampleCard(
                'Present Tense',
                'Actions happening now',
                'Example: nkora (I work)',
              ),
              _buildExampleCard(
                'Past Tense',
                'Actions that happened before',
                'Example: nkoreye (I worked)',
              ),
              _buildExampleCard(
                'Future Tense',
                'Actions that will happen',
                'Example: nkorakora (I will work)',
              ),
            ],
          ),
          _buildSection(
            'Verb Conjugation',
            'How to conjugate verbs in different tenses',
            [
              _buildExampleCard(
                'Basic Conjugation',
                'Adding subject prefixes',
                'Example: kora (to work) → nkora (I work)',
              ),
              _buildExampleCard(
                'Negative Forms',
                'Making verbs negative',
                'Example: nkora (I work) → sinikora (I don\'t work)',
              ),
            ],
          ),
          _buildSection(
            'Verb Extensions',
            'Adding meaning to verbs',
            [
              _buildExampleCard(
                'Causative',
                'Making someone do something',
                'Example: kora (to work) → korera (to make work)',
              ),
              _buildExampleCard(
                'Passive',
                'Being acted upon',
                'Example: kora (to work) → korwa (to be worked)',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> examples) {
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
        ...examples,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildExampleCard(String title, String description, String example) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                example,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 