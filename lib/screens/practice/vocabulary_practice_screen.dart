import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../components/app_components.dart';

class VocabularyPracticeScreen extends StatefulWidget {
  const VocabularyPracticeScreen({super.key});

  @override
  State<VocabularyPracticeScreen> createState() => _VocabularyPracticeScreenState();
}

class _VocabularyPracticeScreenState extends State<VocabularyPracticeScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the Kifuliiru word for "Hello"?',
      'options': ['Muraho', 'Amahoro', 'Bite', 'Murakoze'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which word means "Thank you" in Kifuliiru?',
      'options': ['Murakoze', 'Muraho', 'Bite', 'Amahoro'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is "Good morning" in Kifuliiru?',
      'options': ['Muraho', 'Bite', 'Murakoze', 'Amahoro'],
      'correctAnswer': 0,
    },
  ];

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex]['correctAnswer']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppComponents.appBar('Vocabulary Practice'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                title: 'Practice Vocabulary',
                description: 'Test your knowledge of Kifuliiru words',
                icon: Icons.edit_note,
              ),
              const SizedBox(height: Spacing.xl),
              if (!showResult) ...[
                // Progress Indicator
                Container(
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
                    children: [
                      LinearProgressIndicator(
                        value: (currentQuestionIndex + 1) / questions.length,
                        backgroundColor: AppColors.neutralLightGrey,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.brandOrange),
                        minHeight: 8,
                      ),
                      const SizedBox(height: Spacing.sm),
                      Text(
                        'Question ${currentQuestionIndex + 1} of ${questions.length}',
                        style: AppTypography.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.xl),
                // Question Card
                ContentCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[currentQuestionIndex]['question'],
                        style: AppTypography.cardTitle,
                      ),
                      const SizedBox(height: Spacing.xl),
                      ...List.generate(
                        questions[currentQuestionIndex]['options'].length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: Spacing.md),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => checkAnswer(index),
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.all(Spacing.md),
                                decoration: BoxDecoration(
                                  color: AppColors.neutralWhite,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.neutralLightGrey,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: AppColors.brandOrange.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          String.fromCharCode(65 + index),
                                          style: AppTypography.cardTitle.copyWith(
                                            color: AppColors.brandOrange,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: Spacing.md),
                                    Expanded(
                                      child: Text(
                                        questions[currentQuestionIndex]['options'][index],
                                        style: AppTypography.bodyLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                // Result Card
                ContentCard(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Spacing.xl),
                        decoration: BoxDecoration(
                          color: AppColors.brandOrange.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          score == questions.length ? Icons.emoji_events : Icons.celebration,
                          color: AppColors.brandOrange,
                          size: 64,
                        ),
                      ),
                      const SizedBox(height: Spacing.xl),
                      Text(
                        'Quiz Complete!',
                        style: AppTypography.h2,
                      ),
                      const SizedBox(height: Spacing.md),
                      Text(
                        'Your score: $score/${questions.length}',
                        style: AppTypography.bodyLarge,
                      ),
                      const SizedBox(height: Spacing.xl),
                      AppButton(
                        text: 'Try Again',
                        onPressed: resetQuiz,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 