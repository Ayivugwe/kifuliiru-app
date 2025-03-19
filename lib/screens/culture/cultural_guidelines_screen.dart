import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CulturalGuidelinesScreen extends StatelessWidget {
  const CulturalGuidelinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Migeeza ye Kifuliiru'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGuidelinesSection(
                    title: 'Ibisubizo byo Kukora',
                    description: 'Things we can do in Fuliiru culture:',
                    items: [
                      'Respect elders and greet them properly',
                      'Participate in community gatherings',
                      'Share food and resources with others',
                      'Maintain family ties and relationships',
                      'Practice traditional ceremonies',
                      'Speak Kifuliiru with pride',
                      'Teach younger generations about our culture',
                      'Support community development',
                    ],
                    icon: Icons.check_circle_outline,
                    color: AppTheme.successColor,
                  ),
                  const SizedBox(height: 24),
                  _buildGuidelinesSection(
                    title: 'Ibisubizo byo Kutakora',
                    description: 'Things we should not do in Fuliiru culture:',
                    items: [
                      'Disrespect elders or community leaders',
                      'Break family bonds',
                      'Ignore traditional ceremonies',
                      'Speak disrespectfully to others',
                      'Waste community resources',
                      'Neglect cultural responsibilities',
                      'Forget our cultural values',
                      'Disregard community rules',
                    ],
                    icon: Icons.cancel_outlined,
                    color: AppTheme.errorColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuidelinesSection({
    required String title,
    required String description,
    required List<String> items,
    required IconData icon,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.textColorLight,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
} 