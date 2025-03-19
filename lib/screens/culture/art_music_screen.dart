import 'package:flutter/material.dart';
import '../../theme.dart';

class ArtMusicScreen extends StatelessWidget {
  const ArtMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Art & Music'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Traditional Music',
            'Traditional musical instruments and styles',
            [
              _buildArtCard(
                'Musical Instruments',
                'Traditional instruments and their uses',
                'Description of various traditional instruments',
                'Examples: drums, string instruments, wind instruments',
              ),
              _buildArtCard(
                'Musical Styles',
                'Traditional music genres and forms',
                'Different types of traditional music',
                'Examples: ceremonial music, folk songs, dance music',
              ),
              _buildArtCard(
                'Performance',
                'Traditional music performance practices',
                'How music is performed in different contexts',
                'Examples: solo performances, group performances',
              ),
            ],
          ),
          _buildSection(
            'Visual Arts',
            'Traditional visual art forms and crafts',
            [
              _buildArtCard(
                'Traditional Crafts',
                'Handcrafted items and their significance',
                'Traditional craft-making techniques',
                'Examples: pottery, weaving, beadwork',
              ),
              _buildArtCard(
                'Body Art',
                'Traditional body decoration practices',
                'Traditional forms of body art',
                'Examples: traditional tattoos, body painting',
              ),
              _buildArtCard(
                'Architecture',
                'Traditional architectural styles',
                'Traditional building techniques and designs',
                'Examples: traditional homes, ceremonial structures',
              ),
            ],
          ),
          _buildSection(
            'Performing Arts',
            'Traditional dance and performance',
            [
              _buildArtCard(
                'Traditional Dance',
                'Traditional dance forms and styles',
                'Different types of traditional dances',
                'Examples: ceremonial dances, social dances',
              ),
              _buildArtCard(
                'Storytelling',
                'Traditional oral performance arts',
                'Traditional storytelling practices',
                'Examples: folktales, myths, legends',
              ),
              _buildArtCard(
                'Theater',
                'Traditional theatrical performances',
                'Traditional performance practices',
                'Examples: ritual performances, community theater',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> arts) {
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
        ...arts,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildArtCard(
    String title,
    String description,
    String details,
    String examples,
  ) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(details),
                  const SizedBox(height: 8),
                  Text(
                    'Examples:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(examples),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 