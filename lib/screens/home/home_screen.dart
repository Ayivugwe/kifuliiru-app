import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Kifuliiru', title: 'Learn & Explore'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.brandOrange.withOpacity(0.05),
              AppColors.brandPurple.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.brandOrange.withOpacity(0.1),
                        AppColors.brandPurple.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Kifuliiru',
                        style: AppTypography.headingLarge.copyWith(
                          color: AppColors.neutralBlack,
                        ),
                      ),
                      const SizedBox(height: Spacing.sm),
                      Text(
                        'Your gateway to learning and exploring the Bafuliiru language and culture.',
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Featured Story
                Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: Spacing.lg),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.neutralBlack.withOpacity(0.7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(Spacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The BAfuliiru People',
                          style: AppTypography.headingMedium.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: Spacing.xs),
                        Text(
                          'Discover the rich heritage and traditions of the BAfuliiru community',
                          style: AppTypography.bodyMedium.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: Spacing.md),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to BAfuliiru story
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.brandOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Read More'),
                        ),
                      ],
                    ),
                  ),
                ),

                // Daily Challenge Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Challenge',
                        style: AppTypography.sectionTitle,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        'Test your knowledge and learn something new every day',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGlassCard(
                              'Word of the Day',
                              'Mukulu',
                              'Grandfather',
                              Icons.book,
                            ),
                            _buildGlassCard(
                              'Pronunciation',
                              'Practice',
                              'Listen & Repeat',
                              Icons.record_voice_over,
                            ),
                            _buildGlassCard(
                              'Quick Quiz',
                              'Test Yourself',
                              '5 Questions',
                              Icons.quiz,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // About Kifuliiru Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Kifuliiru',
                        style: AppTypography.sectionTitle,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        'Discover the rich heritage and linguistic roots of the BAfuliiru people',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                        children: [
                          _buildGlassFeatureCard(
                            context,
                            'BAfuliiru',
                            'People and History',
                            Icons.people,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CustomsScreen()),
                            ),
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Ibufuliiru',
                            'Language Origins',
                            Icons.language,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GrammarScreen()),
                            ),
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Dictionary',
                            'Word Meanings',
                            Icons.book,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DictionaryScreen()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Quick Stats Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Stats',
                        style: AppTypography.sectionTitle,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        'Key information about the BAfuliiru language and community',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                        childAspectRatio: 1.2,
                        children: [
                          _buildGlassStatCard(
                            'Speakers',
                            '50K+',
                            Icons.people,
                            AppColors.brandOrange,
                          ),
                          _buildGlassStatCard(
                            'Words',
                            '10K+',
                            Icons.book,
                            AppColors.brandPurple,
                          ),
                          _buildGlassStatCard(
                            'Countries',
                            '3+',
                            Icons.public,
                            AppColors.brandOrange,
                          ),
                          _buildGlassStatCard(
                            'Dialects',
                            '2',
                            Icons.language,
                            AppColors.brandPurple,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Learning & Resources Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learning & Resources',
                        style: AppTypography.sectionTitle,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        'Access comprehensive learning materials and structured paths',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGlassCard(
                              'Beginner',
                              'Start Here',
                              'Basic Phrases & Grammar',
                              Icons.play_circle,
                            ),
                            _buildGlassCard(
                              'Intermediate',
                              'Level Up',
                              'Conversations & Culture',
                              Icons.trending_up,
                            ),
                            _buildGlassCard(
                              'Resources',
                              'Study Materials',
                              'Audio, Video & More',
                              Icons.library_books,
                            ),
                            _buildGlassCard(
                              'Practice',
                              'Exercises',
                              'Interactive Learning',
                              Icons.edit_note,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                        children: [
                          _buildGlassFeatureCard(
                            context,
                            'Audio',
                            'Pronunciation Guide',
                            Icons.audiotrack,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Videos',
                            'Visual Lessons',
                            Icons.video_library,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Materials',
                            'Study Resources',
                            Icons.library_books,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Practice',
                            'Interactive Exercises',
                            Icons.edit_note,
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Community & Updates Section
                Container(
                  margin: const EdgeInsets.all(Spacing.lg),
                  padding: const EdgeInsets.all(Spacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neutralBlack.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Community & Updates',
                        style: AppTypography.sectionTitle,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        'Connect with the community and stay updated',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.neutralGrey,
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGlassCard(
                              'Events',
                              'Calendar',
                              'Community Meetups',
                              Icons.event,
                            ),
                            _buildGlassCard(
                              'Forums',
                              'Discussion',
                              'Share & Learn',
                              Icons.forum,
                            ),
                            _buildGlassCard(
                              'Stories',
                              'Success',
                              'Journey Stories',
                              Icons.auto_stories,
                            ),
                            _buildGlassCard(
                              'News',
                              'Updates',
                              'Latest Updates',
                              Icons.newspaper,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.md),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: Spacing.md,
                        crossAxisSpacing: Spacing.md,
                        children: [
                          _buildGlassFeatureCard(
                            context,
                            'Events',
                            'Calendar & Meetups',
                            Icons.event,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Forums',
                            'Discussion Boards',
                            Icons.forum,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Stories',
                            'Success Journeys',
                            Icons.auto_stories,
                            () {},
                          ),
                          _buildGlassFeatureCard(
                            context,
                            'Exchange',
                            'Language Partners',
                            Icons.people_outline,
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassCard(String title, String subtitle, String description, IconData icon) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: Spacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutralBlack.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(Spacing.xs),
                  decoration: BoxDecoration(
                    color: AppColors.brandOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.brandOrange,
                    size: 20,
                  ),
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  title,
                  style: AppTypography.cardTitle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  subtitle,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.brandOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutralBlack.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(Spacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.brandOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.brandOrange,
                    size: 24,
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  title,
                  style: AppTypography.cardTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.xs),
                Text(
                  description,
                  style: AppTypography.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutralBlack.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(height: Spacing.sm),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          Text(
            title,
            style: AppTypography.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 