import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../components/app_components.dart';

class VerbsScreen extends StatelessWidget {
  const VerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Verbs', title: 'Verbs'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                title: 'Kifuliiru Verbs',
                description: 'Learn about verb tenses and conjugations',
                icon: Icons.auto_awesome,
              ),
              const SizedBox(height: Spacing.xl),
              Text('Verb Tenses', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    Text(
                      'Kifuliiru verbs change form to indicate different tenses, aspects, and moods. Understanding these changes is crucial for proper communication.',
                      style: AppTypography.cardSubtitle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.lg),
              Text('Common Tenses', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Spacing.md,
                crossAxisSpacing: Spacing.md,
                children: [
                  FeatureCard(
                    title: 'Present',
                    description: 'Current actions',
                    icon: Icons.access_time,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Past',
                    description: 'Completed actions',
                    icon: Icons.history,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Future',
                    description: 'Planned actions',
                    icon: Icons.schedule,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Perfect',
                    description: 'Completed with relevance',
                    icon: Icons.check_circle,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: Spacing.xl),
              Text('Examples', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Present Tense', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    _buildExampleItem('nina', 'I have'),
                    _buildExampleItem('ulina', 'you have'),
                    _buildExampleItem('afise', 'he/she has'),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.lg),
              ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Past Tense', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    _buildExampleItem('nari', 'I was'),
                    _buildExampleItem('wari', 'you were'),
                    _buildExampleItem('yari', 'he/she was'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExampleItem(String kifuliiru, String english) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Text(
            kifuliiru,
            style: AppTypography.cardTitle.copyWith(
              color: AppColors.brandPurple,
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            '($english)',
            style: AppTypography.cardSubtitle,
          ),
        ],
      ),
    );
  }
} 