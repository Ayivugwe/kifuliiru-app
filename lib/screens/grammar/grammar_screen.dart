import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../components/app_components.dart';
import 'nouns_screen.dart';
import 'verbs_screen.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Grammar', title: 'Grammar'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                title: 'Kifuliiru Grammar',
                description: 'Learn the structure and rules of Kifuliiru language',
                icon: Icons.auto_awesome,
              ),
              const SizedBox(height: Spacing.xl),
              Text('Grammar Categories', style: AppTypography.sectionTitle),
              const SizedBox(height: Spacing.md),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Spacing.md,
                crossAxisSpacing: Spacing.md,
                children: [
                  FeatureCard(
                    title: 'Nouns',
                    description: 'Learn about noun classes and pluralization',
                    icon: Icons.format_list_bulleted,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NounsScreen()),
                    ),
                  ),
                  FeatureCard(
                    title: 'Verbs',
                    description: 'Study verb tenses and conjugations',
                    icon: Icons.auto_awesome,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerbsScreen()),
                    ),
                  ),
                  FeatureCard(
                    title: 'Adjectives',
                    description: 'Learn about descriptive words',
                    icon: Icons.format_color_text,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Pronouns',
                    description: 'Study personal and possessive pronouns',
                    icon: Icons.person,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Sentence Structure',
                    description: 'Learn how to form correct sentences',
                    icon: Icons.format_quote,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Tenses',
                    description: 'Understand different time expressions',
                    icon: Icons.access_time,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 