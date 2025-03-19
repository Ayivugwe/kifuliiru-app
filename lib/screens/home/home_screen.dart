import 'package:flutter/material.dart';
import '../../theme.dart';
import '../dictionary/dictionary_selection_screen.dart';
import '../culture/culture_screen.dart';
import '../diaspora/diaspora_screen.dart';
import '../news/news_screen.dart';
import '../contribute/contribute_screen.dart';
import '../translate/translate_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import '../grammar/grammar_screen.dart';
import '../pronunciation/pronunciation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Search and Profile
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                ),
              ),
            ],
          ),

          // Welcome Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Kifuliiru',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: KifuliiruTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover the rich culture and language of the Fuliiru people',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Our Language Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Language',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn and explore the Kifuliiru language',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Dictionary',
                          'Search and learn Kifuliiru words',
                          Icons.book,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DictionarySelectionScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Translate',
                          'Translate between languages',
                          Icons.translate,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TranslateScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Grammar',
                          'Study Kifuliiru grammar rules',
                          Icons.auto_awesome,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GrammarScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Pronunciation',
                          'Practice correct pronunciation',
                          Icons.record_voice_over,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PronunciationScreen()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Culture Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Culture',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore Fuliiru traditions and heritage',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Traditions',
                          'Learn about Fuliiru traditions',
                          Icons.celebration,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CultureScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Customs',
                          'Explore Fuliiru customs',
                          Icons.people,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Festivals',
                          'Discover Fuliiru festivals',
                          Icons.event,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Art & Music',
                          'Experience Fuliiru arts',
                          Icons.music_note,
                          () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Community Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Community',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connect and contribute to the Fuliiru community',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Contribute',
                          'Help improve the app',
                          Icons.add_circle,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContributeScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Diaspora',
                          'Connect with Fuliiru worldwide',
                          Icons.public,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DiasporaScreen()),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Events',
                          'Find community events',
                          Icons.event_busy,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'News',
                          'Stay updated with news',
                          Icons.newspaper,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewsScreen()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Learning Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learning',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Resources and tools for learning Kifuliiru',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Lessons',
                          'Structured learning materials',
                          Icons.school,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Practice',
                          'Interactive exercises',
                          Icons.edit_note,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Quizzes',
                          'Test your knowledge',
                          Icons.quiz,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Progress',
                          'Track your learning journey',
                          Icons.trending_up,
                          () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Support Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Support',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get help and support for using the app',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'FAQ',
                          'Frequently asked questions',
                          Icons.help_outline,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Contact',
                          'Get in touch with us',
                          Icons.contact_support,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'Feedback',
                          'Share your thoughts',
                          Icons.feedback,
                          () {},
                        ),
                        _buildFeatureCard(
                          context,
                          'About',
                          'Learn about the app',
                          Icons.info_outline,
                          () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 40,
                      color: KifuliiruTheme.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 