// contribute_screen.dart
import 'package:flutter/material.dart';

class ContributeScreen extends StatelessWidget {
  final String title;
  const ContributeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contribute'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to Contribute',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Help our community grow by contributing in various ways:',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildContributeOption(
            'Add Words',
            Icons.post_add,
            'Contribute new words and phrases',
          ),
          _buildContributeOption(
            'Review Content',
            Icons.rate_review,
            'Help review and verify submissions',
          ),
          _buildContributeOption(
            'Translate',
            Icons.translate,
            'Help with translations',
          ),
          _buildContributeOption(
            'Report Issues',
            Icons.bug_report,
            'Report bugs or suggest improvements',
          ),
        ],
      ),
    );
  }

  Widget _buildContributeOption(
      String title, IconData icon, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
