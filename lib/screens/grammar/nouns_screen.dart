import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../components/app_components.dart';

class NounsScreen extends StatelessWidget {
  const NounsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Nouns'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                title: 'Kifuliiru Nouns',
                description: 'Learn about noun classes and their usage',
                icon: Icons.format_list_bulleted,
              ),
              const SizedBox(height: Spacing.xl),
              Text('Noun Classes', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    Text(
                      'Kifuliiru has several noun classes that affect how words are used in sentences. Each class has its own prefix and agreement markers.',
                      style: AppTypography.cardSubtitle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.lg),
              Text('Common Patterns', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Spacing.md,
                crossAxisSpacing: Spacing.md,
                children: [
                  FeatureCard(
                    title: 'Class 1',
                    description: 'People and living beings',
                    icon: Icons.person,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Class 2',
                    description: 'Plural of Class 1',
                    icon: Icons.people,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Class 3',
                    description: 'Trees and plants',
                    icon: Icons.forest,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Class 4',
                    description: 'Plural of Class 3',
                    icon: Icons.forest,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Class 5',
                    description: 'Abstract concepts',
                    icon: Icons.psychology,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Class 6',
                    description: 'Plural of Class 5',
                    icon: Icons.psychology,
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
                    Text('Class 1 Examples', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    _buildExampleItem('umuntu', 'person'),
                    _buildExampleItem('umuhungu', 'boy'),
                    _buildExampleItem('umukobwa', 'girl'),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.lg),
              ContentCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Class 2 Examples', style: AppTypography.cardTitle),
                    const SizedBox(height: Spacing.md),
                    _buildExampleItem('abantu', 'people'),
                    _buildExampleItem('abahungu', 'boys'),
                    _buildExampleItem('abakobwa', 'girls'),
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