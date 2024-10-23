// learning_screen.dart
import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final String title;

  const LearningScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose what to learn:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildLearningCard('Vocabulary', Icons.book),
                  _buildLearningCard('Grammar', Icons.school),
                  _buildLearningCard('Phrases', Icons.chat),
                  _buildLearningCard('Culture', Icons.public),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningCard(String title, IconData icon) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
