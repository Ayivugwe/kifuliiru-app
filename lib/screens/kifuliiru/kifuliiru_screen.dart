import 'package:flutter/material.dart';
import '../../theme/app_theme.dart' as theme;
import '../../components/app_components.dart';

class KifuliiruScreen extends StatelessWidget {
  const KifuliiruScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppComponents.appBar('About Kifuliiru', title: 'About Kifuliiru'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: theme.AppColors.brandGradient,
                image: const DecorationImage(
                  image: AssetImage('assets/images/kifuliiru_hero.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'The BAfuliiru People',
                  style: theme.AppTypography.headingLarge.copyWith(
                    color: theme.AppColors.neutralWhite,
                    shadows: [
                      const Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content Sections
            Padding(
              padding: const EdgeInsets.all(theme.Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introduction
                  AppComponents.contentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who We Are',
                          style: theme.AppTypography.headingMedium,
                        ),
                        const SizedBox(height: theme.Spacing.sm),
                        Text(
                          'The BAfuliiru are a Bantu ethnic group primarily found in the Democratic Republic of Congo, with significant populations in Uganda and Tanzania. Our rich cultural heritage and unique language have been preserved through generations.',
                          style: theme.AppTypography.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: theme.Spacing.lg),

                  // Language Section
                  AppComponents.contentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Language',
                          style: theme.AppTypography.headingMedium,
                        ),
                        const SizedBox(height: theme.Spacing.sm),
                        Text(
                          'Kifuliiru is a rich and complex language with unique phonological features and a rich vocabulary. It is known for its distinctive tone system and complex verb morphology.',
                          style: theme.AppTypography.bodyLarge,
                        ),
                        const SizedBox(height: theme.Spacing.md),
                        _buildLanguageFeature(
                          'Tonal System',
                          'Features high, low, and falling tones that distinguish meaning',
                          Icons.music_note,
                        ),
                        _buildLanguageFeature(
                          'Verb Morphology',
                          'Complex system of prefixes and suffixes to modify verb meaning',
                          Icons.change_history,
                        ),
                        _buildLanguageFeature(
                          'Noun Classes',
                          'Organized system of noun categories with specific agreement patterns',
                          Icons.category,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: theme.Spacing.lg),

                  // Cultural Heritage
                  AppComponents.contentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cultural Heritage',
                          style: theme.AppTypography.headingMedium,
                        ),
                        const SizedBox(height: theme.Spacing.sm),
                        Text(
                          'The BAfuliiru have a rich cultural heritage that includes traditional music, dance, and oral literature. Our cultural practices reflect our deep connection to our ancestral lands and community values.',
                          style: theme.AppTypography.bodyLarge,
                        ),
                        const SizedBox(height: theme.Spacing.md),
                        _buildCulturalElement(
                          'Traditional Music',
                          'Rhythmic patterns and vocal harmonies passed down through generations',
                          Icons.music_note,
                        ),
                        _buildCulturalElement(
                          'Oral Traditions',
                          'Stories, proverbs, and wisdom preserved through storytelling',
                          Icons.record_voice_over,
                        ),
                        _buildCulturalElement(
                          'Ceremonies',
                          'Important life events marked by traditional ceremonies',
                          Icons.celebration,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: theme.Spacing.lg),

                  // Modern Identity
                  AppComponents.contentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modern Identity',
                          style: theme.AppTypography.headingMedium,
                        ),
                        const SizedBox(height: theme.Spacing.sm),
                        Text(
                          'Today, the BAfuliiru community continues to preserve and promote our language and culture while adapting to modern life. Our diaspora plays a crucial role in maintaining and revitalizing our heritage.',
                          style: theme.AppTypography.bodyLarge,
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
    );
  }

  Widget _buildLanguageFeature(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: theme.Spacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(theme.Spacing.sm),
            decoration: BoxDecoration(
              color: theme.AppColors.brandOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: theme.AppColors.brandOrange,
              size: 24,
            ),
          ),
          const SizedBox(width: theme.Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: theme.Spacing.xs),
                Text(
                  description,
                  style: theme.AppTypography.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCulturalElement(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: theme.Spacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(theme.Spacing.sm),
            decoration: BoxDecoration(
              color: theme.AppColors.brandPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: theme.AppColors.brandPurple,
              size: 24,
            ),
          ),
          const SizedBox(width: theme.Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: theme.Spacing.xs),
                Text(
                  description,
                  style: theme.AppTypography.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 