// study_tools_screen.dart

import 'package:flutter/material.dart';

class StudyToolsScreen extends StatelessWidget {
  final String title;
  const StudyToolsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Tools'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildToolCard(
            'Flashcards',
            Icons.flip_to_back,
            'Practice with interactive flashcards',
          ),
          _buildToolCard(
            'Quiz',
            Icons.quiz,
            'Test your knowledge',
          ),
          _buildToolCard(
            'Dictionary',
            Icons.menu_book,
            'Look up words and meanings',
          ),
          _buildToolCard(
            'Notes',
            Icons.note_add,
            'Create and organize study notes',
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard(String title, IconData icon, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
