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
      appBar: AppComponents.appBar('Kifuliiru', title: 'Kifuliiru'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Daily Challenge Section
              Container(
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.brandOrange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.emoji_events,
                            color: AppColors.brandOrange,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: Spacing.md),
                        Text(
                          'Daily Challenge',
                          style: AppTypography.h3.copyWith(
                            color: AppColors.neutralBlack,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Spacing.md),
                    Container(
                      padding: const EdgeInsets.all(Spacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.neutralWhite,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neutralBlack.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Word of the Day',
                                  style: AppTypography.cardTitle,
                                ),
                                const SizedBox(height: Spacing.xs),
                                Text(
                                  'Mukulu',
                                  style: AppTypography.headingMedium.copyWith(
                                    color: AppColors.brandOrange,
                                  ),
                                ),
                                const SizedBox(height: Spacing.xs),
                                Text(
                                  'Meaning: Grandfather',
                                  style: AppTypography.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.brandOrange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.volume_up,
                              color: AppColors.brandOrange,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // About Kifuliiru Section
              Padding(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About Kifuliiru', style: AppTypography.sectionTitle),
                    const SizedBox(height: Spacing.md),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFeatureCard(
                            context,
                            'BAfuliiru',
                            'People and History',
                            Icons.people,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CustomsScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Ibufuliiru',
                            'Language Origins',
                            Icons.language,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GrammarScreen()),
                            ),
                          ),
                          _buildFeatureCard(
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
                    ),
                  ],
                ),
              ),

              // Culture Section
              Container(
                padding: const EdgeInsets.all(Spacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.neutralWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neutralBlack.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Culture & Heritage', style: AppTypography.sectionTitle),
                    const SizedBox(height: Spacing.md),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFeatureCard(
                            context,
                            'Customs',
                            'Traditional Practices',
                            Icons.people,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CustomsScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Festivals',
                            'Cultural Celebrations',
                            Icons.celebration,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FestivalsScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Art & Music',
                            'Traditional Arts',
                            Icons.music_note,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ArtMusicScreen()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Community Section
              Padding(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Join the Community', style: AppTypography.sectionTitle),
                    const SizedBox(height: Spacing.md),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFeatureCard(
                            context,
                            'Diaspora',
                            'Connect Worldwide',
                            Icons.public,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DiasporaScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'News',
                            'Latest Updates',
                            Icons.newspaper,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NewsScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Contribute',
                            'Help Preserve',
                            Icons.volunteer_activism,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PracticeScreen()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Learning Section
              Container(
                padding: const EdgeInsets.all(Spacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.neutralWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neutralBlack.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Learning', style: AppTypography.sectionTitle),
                    const SizedBox(height: Spacing.md),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFeatureCard(
                            context,
                            'Lessons',
                            'Structured Learning',
                            Icons.school,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LessonsScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Practice',
                            'Interactive Exercises',
                            Icons.edit_note,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PracticeScreen()),
                            ),
                          ),
                          _buildFeatureCard(
                            context,
                            'Grammar',
                            'Language Structure',
                            Icons.auto_awesome,
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GrammarScreen()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: Spacing.md),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(Spacing.md),
            decoration: BoxDecoration(
              color: AppColors.neutralWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutralBlack.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                    size: 28,
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                Flexible(
                  child: Text(
                    title,
                    style: AppTypography.cardTitle,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: Spacing.xs),
                Flexible(
                  child: Text(
                    description,
                    style: AppTypography.cardSubtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 