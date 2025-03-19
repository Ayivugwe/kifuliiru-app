import 'package:flutter/material.dart';
import '../../theme.dart';

class NounsScreen extends StatelessWidget {
  const NounsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouns'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Noun Classes',
            'Kifuliiru has several noun classes that affect agreement and pluralization',
            [
              _buildExampleCard(
                'Class 1 (mu-)',
                'People and animate beings',
                'Example: muntu (person) → bantu (people)',
              ),
              _buildExampleCard(
                'Class 2 (ba-)',
                'Plural of class 1',
                'Example: bantu (people)',
              ),
              _buildExampleCard(
                'Class 3 (mu-)',
                'Plants and natural objects',
                'Example: muti (tree) → miti (trees)',
              ),
            ],
          ),
          _buildSection(
            'Pluralization',
            'How to form plural nouns in different classes',
            [
              _buildExampleCard(
                'Basic Rule',
                'Change the prefix according to class',
                'Example: muntu → bantu',
              ),
              _buildExampleCard(
                'Special Cases',
                'Irregular plural forms',
                'Example: muti → miti',
              ),
            ],
          ),
          _buildSection(
            'Possession',
            'How to show possession with nouns',
            [
              _buildExampleCard(
                'Basic Possession',
                'Using possessive pronouns',
                'Example: muti wange (my tree)',
              ),
              _buildExampleCard(
                'Multiple Possessors',
                'Combining possessors',
                'Example: muti wabo (their tree)',
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