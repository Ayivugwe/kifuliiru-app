import 'package:flutter/material.dart';
import '../../theme.dart';

class TraditionsScreen extends StatefulWidget {
  const TraditionsScreen({Key? key}) : super(key: key);

  @override
  State<TraditionsScreen> createState() => _TraditionsScreenState();
}

class _TraditionsScreenState extends State<TraditionsScreen> {
  final List<Map<String, dynamic>> _traditions = [
    {
      'title': 'Marriage Ceremonies',
      'description': 'Traditional Fuliiru marriage ceremonies involve various rituals and celebrations that bring families together.',
      'icon': Icons.favorite_outline,
      'details': [
        'Engagement rituals',
        'Family negotiations',
        'Traditional ceremonies',
        'Modern adaptations',
      ],
    },
    {
      'title': 'Birth Celebrations',
      'description': 'The birth of a child is celebrated with specific rituals and ceremonies in Fuliiru culture.',
      'icon': Icons.child_care_outlined,
      'details': [
        'Naming ceremonies',
        'Family gatherings',
        'Traditional blessings',
        'Community involvement',
      ],
    },
    {
      'title': 'Harvest Festivals',
      'description': 'Annual harvest celebrations mark the importance of agriculture in Fuliiru culture.',
      'icon': Icons.agriculture_outlined,
      'details': [
        'Harvest rituals',
        'Community feasts',
        'Traditional dances',
        'Gratitude ceremonies',
      ],
    },
    {
      'title': 'Coming of Age',
      'description': 'Traditional ceremonies marking the transition from childhood to adulthood.',
      'icon': Icons.person_outline,
      'details': [
        'Initiation rituals',
        'Traditional teachings',
        'Community recognition',
        'Modern celebrations',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Traditions',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      KifuliiruTheme.primaryColor,
                      KifuliiruTheme.primaryColor.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.celebration_outlined,
                    size: 80,
                    color: Colors.white.withOpacity(0.3),
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
                  for (var tradition in _traditions) ...[
                    _buildTraditionCard(context, tradition),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraditionCard(BuildContext context, Map<String, dynamic> tradition) {
    return ExpansionTile(
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: KifuliiruTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          tradition['icon'],
          color: KifuliiruTheme.primaryColor,
          size: 24,
        ),
      ),
      title: Text(
        tradition['title'],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        tradition['description'],
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var detail in tradition['details']) ...[
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: KifuliiruTheme.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      detail,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Navigate to detailed tradition view
                  },
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Learn More'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KifuliiruTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 