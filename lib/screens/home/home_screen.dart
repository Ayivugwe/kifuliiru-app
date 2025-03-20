import 'package:flutter/material.dart';
import '../../theme/app_theme.dart' as theme;
import '../../components/app_components.dart';
import '../dictionary/dictionary_screen.dart';
import '../culture/customs_screen.dart';
import '../culture/festivals_screen.dart';
import '../culture/art_music_screen.dart';
import '../grammar/grammar_screen.dart';
import '../learning/lessons_screen.dart';
import '../practice/practice_screen.dart';
import '../diaspora/diaspora_screen.dart';
import '../news/news_screen.dart';
import '../kifuliiru/kifuliiru_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar(
        title: 'Fuliiru Hub',
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Navigate to profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Padding(
              padding: const EdgeInsets.all(theme.Spacing.lg),
              child: AppComponents.infoCard(
                title: 'Welcome to Fuliiru Hub',
                description: 'Your gateway to learning and exploring the BAfuliiru language and culture.',
                icon: Icons.waving_hand,
              ),
            ),

            // Featured News Slider
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: theme.Spacing.md),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Replace with actual news items
                itemBuilder: (context, index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.only(
                      left: index == 0 ? theme.Spacing.lg : theme.Spacing.md,
                      right: index == 2 ? theme.Spacing.lg : 0,
                    ),
                    child: AppComponents.contentCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Featured Story ${index + 1}',
                            style: theme.AppTypography.sectionTitle,
                          ),
                          const SizedBox(height: theme.Spacing.xs),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: theme.AppTypography.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // About Kifuliiru Section
            Padding(
              padding: const EdgeInsets.all(theme.Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Kifuliiru', style: theme.AppTypography.sectionTitle),
                  const SizedBox(height: theme.Spacing.xs),
                  Text(
                    'Discover the rich history, language, and identity of the BAfuliiru people through our comprehensive resources.',
                    style: theme.AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: theme.Spacing.md),
                  AppComponents.featureCard(
                    title: 'Explore Kifuliiru',
                    description: 'Learn about the history, culture, and traditions of the BAfuliiru people.',
                    icon: Icons.history_edu,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KifuliiruScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Quick Stats Section
            Padding(
              padding: const EdgeInsets.all(theme.Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Stats', style: theme.AppTypography.sectionTitle),
                  const SizedBox(height: theme.Spacing.xs),
                  Text(
                    'Key information about the BAfuliiru language and community.',
                    style: theme.AppTypography.bodyMedium,
                  ),
                  const SizedBox(height: theme.Spacing.md),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: theme.Spacing.md,
                    crossAxisSpacing: theme.Spacing.md,
                    childAspectRatio: 1.2,
                    children: [
                      _buildStatCard(
                        'Speakers',
                        '50K+',
                        Icons.people,
                        theme.AppColors.brandOrange,
                      ),
                      _buildStatCard(
                        'Words',
                        '10K+',
                        Icons.book,
                        theme.AppColors.brandPurple,
                      ),
                      _buildStatCard(
                        'Countries',
                        '3+',
                        Icons.public,
                        theme.AppColors.brandOrange,
                      ),
                      _buildStatCard(
                        'Dialects',
                        '2',
                        Icons.language,
                        theme.AppColors.brandPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(theme.Spacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: theme.Spacing.sm),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: theme.Spacing.xs),
          Text(
            title,
            style: theme.AppTypography.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 