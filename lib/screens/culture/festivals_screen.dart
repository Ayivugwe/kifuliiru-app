import 'package:flutter/material.dart';
import '../../theme.dart';

class FestivalsScreen extends StatelessWidget {
  const FestivalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festivals & Celebrations'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Traditional Festivals',
            'Major cultural celebrations throughout the year',
            [
              _buildFestivalCard(
                'Harvest Festival',
                'Celebration of successful harvests',
                'Traditional ceremonies and feasts',
                'Usually held after the main harvest season',
              ),
              _buildFestivalCard(
                'New Year Celebration',
                'Traditional new year festivities',
                'Cultural rituals and community gatherings',
                'Marks the beginning of the new year',
              ),
              _buildFestivalCard(
                'Ancestral Commemoration',
                'Honoring ancestors and heritage',
                'Traditional ceremonies and offerings',
                'Regular cultural observance',
              ),
            ],
          ),
          _buildSection(
            'Life Cycle Celebrations',
            'Important celebrations marking life stages',
            [
              _buildFestivalCard(
                'Birth Celebrations',
                'Traditional birth ceremonies',
                'Naming rituals and family gatherings',
                'Held shortly after birth',
              ),
              _buildFestivalCard(
                'Coming of Age',
                'Traditional initiation ceremonies',
                'Rites of passage celebrations',
                'Marking transition to adulthood',
              ),
              _buildFestivalCard(
                'Marriage Celebrations',
                'Traditional wedding ceremonies',
                'Extended family celebrations',
                'Multi-day festivities',
              ),
            ],
          ),
          _buildSection(
            'Community Gatherings',
            'Regular community celebrations',
            [
              _buildFestivalCard(
                'Community Meetings',
                'Traditional community assemblies',
                'Decision-making and celebrations',
                'Regular community events',
              ),
              _buildFestivalCard(
                'Cultural Performances',
                'Traditional music and dance events',
                'Community entertainment and celebration',
                'Regular cultural gatherings',
              ),
              _buildFestivalCard(
                'Market Days',
                'Traditional market gatherings',
                'Trade and social interaction',
                'Regular community events',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> festivals) {
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
        ...festivals,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildFestivalCard(
    String title,
    String description,
    String activities,
    String timing,
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
                    'Activities:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(activities),
                  const SizedBox(height: 8),
                  Text(
                    'Timing:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(timing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 