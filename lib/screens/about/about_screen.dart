import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Twehe'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: 'About Kifuliiru App',
                    content: 'The Kifuliiru App is dedicated to preserving and promoting the Fuliiru language and culture. Our mission is to make the Fuliiru language accessible to everyone, whether you\'re a native speaker or someone interested in learning about this rich cultural heritage.',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Our Mission',
                    content: 'We strive to:\n\n'
                        '• Preserve the Fuliiru language for future generations\n'
                        '• Provide educational resources for language learning\n'
                        '• Connect Fuliiru communities worldwide\n'
                        '• Promote cultural understanding and appreciation',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Features',
                    content: '• Comprehensive Kifuliiru dictionary\n'
                        '• Cultural information and traditions\n'
                        '• News and updates from the community\n'
                        '• Multi-language support\n'
                        '• Community engagement tools',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Get Involved',
                    content: 'We welcome contributions from the community! Visit Fuliiru Hub to:\n\n'
                        '• Contribute to the dictionary\n'
                        '• Share cultural content\n'
                        '• Participate in translations\n'
                        '• Connect with other community members',
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Contact Us',
                    content: 'Have questions or suggestions? We\'d love to hear from you!\n\n'
                        'Email: contact@kifuliiru.app\n'
                        'Website: www.kifuliiru.app',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
} 