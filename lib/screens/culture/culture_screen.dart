import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'cultural_guidelines_screen.dart';
import '../content/kifuliiru_content_screen.dart';

class CultureScreen extends StatelessWidget {
  const CultureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Culture'),
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
                  _buildSection(
                    title: 'Cultural Guidelines',
                    description: 'Learn about Fuliiru cultural practices and traditions',
                    icon: Icons.auto_awesome_outlined,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CulturalGuidelinesScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Kifuliiru Content',
                    description: 'Discover books, websites, and other resources in Kifuliiru',
                    icon: Icons.menu_book_outlined,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KifuliiruContentScreen(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Traditions',
                    description: 'Explore Fuliiru traditional ceremonies and customs',
                    icon: Icons.celebration_outlined,
                    onTap: () {
                      // TODO: Navigate to Traditions screen
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    title: 'Community',
                    description: 'Connect with Fuliiru communities worldwide',
                    icon: Icons.people_outline,
                    onTap: () {
                      // TODO: Navigate to Community screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryColor,
                size: 24,
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
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
} 