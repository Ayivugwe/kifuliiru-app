import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../models/lesson.dart';
import 'lesson_category_screen.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Beginner Level',
            'Start your journey with basic Kifuliiru',
            [
              _buildLessonCard(
                context,
                'Basic Greetings',
                'Learn common greetings and introductions',
                Icons.waving_hand,
                'Beginner',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Basic Greetings',
                      level: 'Beginner',
                      lessons: [
                        Lesson(
                          title: 'Hello and Goodbye',
                          description: 'Learn basic greetings',
                          duration: '10 min',
                          isLocked: false,
                        ),
                        Lesson(
                          title: 'How are you?',
                          description: 'Ask and respond to well-being',
                          duration: '15 min',
                          isLocked: false,
                        ),
                        Lesson(
                          title: 'Introductions',
                          description: 'Introduce yourself and others',
                          duration: '15 min',
                          isLocked: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildLessonCard(
                context,
                'Numbers 1-10',
                'Learn to count in Kifuliiru',
                Icons.numbers,
                'Beginner',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Numbers 1-10',
                      level: 'Beginner',
                      lessons: [
                        Lesson(
                          title: 'Counting 1-5',
                          description: 'Learn numbers one through five',
                          duration: '10 min',
                          isLocked: false,
                        ),
                        Lesson(
                          title: 'Counting 6-10',
                          description: 'Learn numbers six through ten',
                          duration: '10 min',
                          isLocked: false,
                        ),
                        Lesson(
                          title: 'Practice Numbers',
                          description: 'Practice using numbers in context',
                          duration: '15 min',
                          isLocked: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildSection(
            'Intermediate Level',
            'Build on your basic knowledge',
            [
              _buildLessonCard(
                context,
                'Daily Activities',
                'Learn to talk about your daily routine',
                Icons.schedule,
                'Intermediate',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Daily Activities',
                      level: 'Intermediate',
                      lessons: [
                        Lesson(
                          title: 'Morning Routine',
                          description: 'Learn morning activities vocabulary',
                          duration: '15 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Work and Study',
                          description: 'Discuss work and study activities',
                          duration: '20 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Evening Activities',
                          description: 'Learn evening activities vocabulary',
                          duration: '15 min',
                          isLocked: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildLessonCard(
                context,
                'Family and Relationships',
                'Learn to talk about family members',
                Icons.family_restroom,
                'Intermediate',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Family and Relationships',
                      level: 'Intermediate',
                      lessons: [
                        Lesson(
                          title: 'Immediate Family',
                          description: 'Learn immediate family terms',
                          duration: '15 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Extended Family',
                          description: 'Learn extended family terms',
                          duration: '15 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Family Activities',
                          description: 'Discuss family activities',
                          duration: '20 min',
                          isLocked: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildSection(
            'Advanced Level',
            'Master complex Kifuliiru concepts',
            [
              _buildLessonCard(
                context,
                'Cultural Expressions',
                'Learn idiomatic expressions and proverbs',
                Icons.auto_awesome,
                'Advanced',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Cultural Expressions',
                      level: 'Advanced',
                      lessons: [
                        Lesson(
                          title: 'Common Proverbs',
                          description: 'Learn traditional proverbs',
                          duration: '20 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Idiomatic Expressions',
                          description: 'Learn common idioms',
                          duration: '20 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Cultural Context',
                          description: 'Understanding cultural references',
                          duration: '25 min',
                          isLocked: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _buildLessonCard(
                context,
                'Business Kifuliiru',
                'Learn business and professional vocabulary',
                Icons.business,
                'Advanced',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonCategoryScreen(
                      title: 'Business Kifuliiru',
                      level: 'Advanced',
                      lessons: [
                        Lesson(
                          title: 'Office Vocabulary',
                          description: 'Learn office-related terms',
                          duration: '20 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Business Meetings',
                          description: 'Learn meeting-related vocabulary',
                          duration: '20 min',
                          isLocked: true,
                        ),
                        Lesson(
                          title: 'Professional Communication',
                          description: 'Learn formal communication',
                          duration: '25 min',
                          isLocked: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> lessons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        ...lessons,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildLessonCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String level,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: KifuliiruTheme.primaryColor,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          color: KifuliiruTheme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 