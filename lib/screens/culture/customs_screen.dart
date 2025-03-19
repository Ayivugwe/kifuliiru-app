import 'package:flutter/material.dart';
import '../../theme.dart';

class CustomsScreen extends StatelessWidget {
  const CustomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customs & Traditions'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Social Customs',
            'Traditional social practices and etiquette',
            [
              _buildCustomCard(
                'Greetings',
                'Traditional greeting customs and protocols',
                'Example: How to greet elders and peers',
              ),
              _buildCustomCard(
                'Family Structure',
                'Family roles and relationships',
                'Understanding family hierarchy and responsibilities',
              ),
              _buildCustomCard(
                'Community Life',
                'Community participation and responsibilities',
                'How community members interact and support each other',
              ),
            ],
          ),
          _buildSection(
            'Cultural Practices',
            'Important cultural customs and rituals',
            [
              _buildCustomCard(
                'Marriage Customs',
                'Traditional marriage practices',
                'From courtship to wedding ceremonies',
              ),
              _buildCustomCard(
                'Naming Ceremonies',
                'Traditional naming practices',
                'How children are named and celebrated',
              ),
              _buildCustomCard(
                'Funeral Rites',
                'Traditional funeral customs',
                'Mourning practices and ceremonies',
              ),
            ],
          ),
          _buildSection(
            'Daily Life',
            'Traditional daily practices',
            [
              _buildCustomCard(
                'Food Customs',
                'Traditional dining practices',
                'How meals are prepared and shared',
              ),
              _buildCustomCard(
                'Dress Code',
                'Traditional clothing customs',
                'Traditional attire and its significance',
              ),
              _buildCustomCard(
                'Work Customs',
                'Traditional work practices',
                'How work is organized in the community',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> customs) {
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
        ...customs,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCustomCard(String title, String description, String example) {
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