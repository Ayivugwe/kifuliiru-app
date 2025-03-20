import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../components/app_components.dart';
import 'vocabulary_practice_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Practice', title: 'Practice'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                title: 'Practice Exercises',
                description: 'Improve your Kifuliiru skills',
                icon: Icons.edit_note,
              ),
              const SizedBox(height: Spacing.xl),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: Spacing.md,
                crossAxisSpacing: Spacing.md,
                children: [
                  _buildPracticeCard(
                    context,
                    'Vocabulary',
                    'Practice Kifuliiru words',
                    Icons.book,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VocabularyPracticeScreen()),
                    ),
                  ),
                  _buildPracticeCard(
                    context,
                    'Grammar',
                    'Practice grammar rules',
                    Icons.auto_awesome,
                    () {},
                  ),
                  _buildPracticeCard(
                    context,
                    'Pronunciation',
                    'Practice speaking',
                    Icons.record_voice_over,
                    () {},
                  ),
                  _buildPracticeCard(
                    context,
                    'Conversation',
                    'Practice dialogues',
                    Icons.chat,
                    () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Material(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: AppColors.brandOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppColors.brandOrange,
                  size: 32,
                ),
              ),
              const SizedBox(height: Spacing.md),
              Text(
                title,
                style: AppTypography.cardTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacing.xs),
              Text(
                description,
                style: AppTypography.cardSubtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 