// contribute_screen.dart
import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';
import 'package:kifuliiru_app/add_words_screen.dart';
import 'package:kifuliiru_app/review_content_screen.dart';
import 'package:kifuliiru_app/translate_screen.dart';
import 'package:kifuliiru_app/report_issues_screen.dart';

class ContributeScreen extends StatelessWidget {
  final String title;
  const ContributeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
          ).createShader(bounds),
          child: const Text(
            'Contribute',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to Contribute',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: KifuliiruTheme.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Help our community grow by contributing in various ways:',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildContributeOption(
            context,
            'Add Words',
            Icons.post_add,
            'Contribute new words and phrases to our dictionary',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddWordsScreen(title: 'Yongera Igambo',),
              ),
            ),
          ),
          _buildContributeOption(
            context,
            'Review Content',
            Icons.rate_review,
            'Help review and verify submissions from the community',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReviewContentScreen(),
              ),
            ),
          ),
          _buildContributeOption(
            context,
            'Translate',
            Icons.translate,
            'Help with translations between Kifuliiru and other languages',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TranslateScreen(),
              ),
            ),
          ),
          _buildContributeOption(
            context,
            'Report Issues',
            Icons.bug_report,
            'Report bugs or suggest improvements for the app',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReportIssuesScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContributeOption(
    BuildContext context,
    String title,
    IconData icon,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: KifuliiruTheme.primaryColor,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: KifuliiruTheme.textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
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
