import 'package:flutter/material.dart';
import '../../theme.dart';

class IbufuliiruScreen extends StatelessWidget {
  const IbufuliiruScreen({Key? key}) : super(key: key);

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
                'Ibufuliiru',
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
                    Icons.landscape_outlined,
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
                  _buildSection(
                    context,
                    'Geographical Location',
                    'The Fuliiru homeland is located in the eastern Democratic Republic of Congo, specifically in the South Kivu province. The region is characterized by its mountainous terrain, fertile valleys, and proximity to Lake Tanganyika.',
                    Icons.location_on_outlined,
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    'Historical Significance',
                    'Ibufuliiru has been the ancestral home of the Fuliiru people for generations. The land holds deep cultural and historical significance, serving as the foundation of Fuliiru identity and traditions.',
                    Icons.history_outlined,
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    'Cultural Landmarks',
                    'The region is home to numerous cultural landmarks, including sacred sites, traditional meeting places, and historical locations that have played important roles in Fuliiru history.',
                    Icons.place_outlined,
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    context,
                    'Natural Resources',
                    'The land is rich in natural resources, including fertile soil for agriculture, water sources, and various minerals. These resources have traditionally supported the Fuliiru way of life.',
                    Icons.forest_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
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
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 