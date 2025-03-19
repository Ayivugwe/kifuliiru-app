import 'package:flutter/material.dart';
import '../../theme.dart';

class LessonContentScreen extends StatefulWidget {
  final String title;
  final String description;
  final String duration;

  const LessonContentScreen({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
  });

  @override
  State<LessonContentScreen> createState() => _LessonContentScreenState();
}

class _LessonContentScreenState extends State<LessonContentScreen> {
  int currentStep = 0;
  final List<LessonStep> steps = [
    LessonStep(
      title: 'Introduction',
      content: 'Welcome to this lesson! Let\'s learn together.',
      type: StepType.introduction,
    ),
    LessonStep(
      title: 'Vocabulary',
      content: 'Here are the key words we\'ll learn:',
      vocabulary: [
        VocabularyItem(
          word: 'Muraho',
          translation: 'Hello',
          example: 'Muraho, mwiri wani?',
          exampleTranslation: 'Hello, how are you?',
        ),
        VocabularyItem(
          word: 'Murakoze',
          translation: 'Thank you',
          example: 'Murakoze cyane',
          exampleTranslation: 'Thank you very much',
        ),
      ],
      type: StepType.vocabulary,
    ),
    LessonStep(
      title: 'Grammar Point',
      content: 'Let\'s learn about basic sentence structure:',
      grammar: GrammarPoint(
        title: 'Basic Sentence Structure',
        explanation: 'In Kifuliiru, the basic sentence structure is Subject-Verb-Object (SVO).',
        example: 'Ndi mwishima',
        exampleTranslation: 'I am happy',
      ),
      type: StepType.grammar,
    ),
    LessonStep(
      title: 'Practice',
      content: 'Let\'s practice what we\'ve learned:',
      practice: PracticeExercise(
        question: 'How do you say "Hello" in Kifuliiru?',
        options: ['Muraho', 'Murakoze', 'Mwiriri', 'Murabeho'],
        correctAnswer: 0,
      ),
      type: StepType.practice,
    ),
    LessonStep(
      title: 'Review',
      content: 'Let\'s review what we\'ve learned:',
      type: StepType.review,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: PageView.builder(
              itemCount: steps.length,
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildStepContent(steps[index]);
              },
            ),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          steps.length,
          (index) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentStep
                  ? KifuliiruTheme.primaryColor
                  : Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(LessonStep step) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            step.content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          _buildStepSpecificContent(step),
        ],
      ),
    );
  }

  Widget _buildStepSpecificContent(LessonStep step) {
    switch (step.type) {
      case StepType.vocabulary:
        return _buildVocabularyContent(step.vocabulary!);
      case StepType.grammar:
        return _buildGrammarContent(step.grammar!);
      case StepType.practice:
        return _buildPracticeContent(step.practice!);
      case StepType.review:
        return _buildReviewContent();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildVocabularyContent(List<VocabularyItem> vocabulary) {
    return Column(
      children: vocabulary.map((item) => _buildVocabularyCard(item)).toList(),
    );
  }

  Widget _buildVocabularyCard(VocabularyItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.word,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.translation,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Example:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(item.example),
                  Text(
                    item.exampleTranslation,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
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

  Widget _buildGrammarContent(GrammarPoint grammar) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              grammar.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(grammar.explanation),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Example:',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(grammar.example),
                  Text(
                    grammar.exampleTranslation,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
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

  Widget _buildPracticeContent(PracticeExercise practice) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              practice.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ...practice.options.asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle answer selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: KifuliiruTheme.primaryColor,
                        side: BorderSide(color: KifuliiruTheme.primaryColor),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: Text(entry.value),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewContent() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Points',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildReviewPoint('Basic greetings in Kifuliiru'),
            _buildReviewPoint('How to say thank you'),
            _buildReviewPoint('Basic sentence structure'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle lesson completion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KifuliiruTheme.primaryColor,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Complete Lesson'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewPoint(String point) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: KifuliiruTheme.primaryColor,
          ),
          const SizedBox(width: 8),
          Text(point),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentStep > 0)
            TextButton(
              onPressed: () {
                setState(() {
                  currentStep--;
                });
              },
              child: const Text('Previous'),
            )
          else
            const SizedBox.shrink(),
          if (currentStep < steps.length - 1)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KifuliiruTheme.primaryColor,
              ),
              child: const Text('Next'),
            )
          else
            ElevatedButton(
              onPressed: () {
                // Handle lesson completion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: KifuliiruTheme.primaryColor,
              ),
              child: const Text('Complete'),
            ),
        ],
      ),
    );
  }
}

enum StepType {
  introduction,
  vocabulary,
  grammar,
  practice,
  review,
}

class LessonStep {
  final String title;
  final String content;
  final StepType type;
  final List<VocabularyItem>? vocabulary;
  final GrammarPoint? grammar;
  final PracticeExercise? practice;

  LessonStep({
    required this.title,
    required this.content,
    required this.type,
    this.vocabulary,
    this.grammar,
    this.practice,
  });
}

class VocabularyItem {
  final String word;
  final String translation;
  final String example;
  final String exampleTranslation;

  VocabularyItem({
    required this.word,
    required this.translation,
    required this.example,
    required this.exampleTranslation,
  });
}

class GrammarPoint {
  final String title;
  final String explanation;
  final String example;
  final String exampleTranslation;

  GrammarPoint({
    required this.title,
    required this.explanation,
    required this.example,
    required this.exampleTranslation,
  });
}

class PracticeExercise {
  final String question;
  final List<String> options;
  final int correctAnswer;

  PracticeExercise({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
} 