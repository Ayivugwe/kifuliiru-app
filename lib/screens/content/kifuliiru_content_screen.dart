import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class KifuliiruContentScreen extends StatelessWidget {
  const KifuliiruContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Ibiyandike mu Kifuliiru'),
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
                    title: 'Ibitabu',
                    content: 'Discover books written in Kifuliiru:',
                    items: [
                      _buildContentCard(
                        'Bible mu Kifuliiru',
                        'The complete Bible translated into Kifuliiru',
                        'https://example.com/bible-kifuliiru',
                        Icons.menu_book,
                      ),
                      _buildContentCard(
                        'Imigani ye Bafuliiru',
                        'Traditional Fuliiru stories and folktales',
                        'https://example.com/imigani',
                        Icons.auto_stories,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Ibisubizo bya Webu',
                    content: 'Websites with Kifuliiru content:',
                    items: [
                      _buildContentCard(
                        'Fuliiru Hub',
                        'Community platform for Kifuliiru content',
                        'https://fuliiruhub.com',
                        Icons.language,
                      ),
                      _buildContentCard(
                        'Kifuliiru Dictionary',
                        'Online dictionary and learning resources',
                        'https://dictionary.kifuliiru.app',
                        Icons.search,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    title: 'Ibisubizo bya Radio',
                    content: 'Radio programs in Kifuliiru:',
                    items: [
                      _buildContentCard(
                        'Radio Fuliiru',
                        'Community radio station broadcasting in Kifuliiru',
                        'https://radio.fuliiru.com',
                        Icons.radio,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required List<Widget> items,
  }) {
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
            color: AppTheme.textColorLight,
          ),
        ),
        const SizedBox(height: 16),
        ...items,
      ],
    );
  }

  Widget _buildContentCard(
    String title,
    String description,
    String url,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            color: AppTheme.textColorLight,
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Implement URL launcher
        },
      ),
    );
  }
} 