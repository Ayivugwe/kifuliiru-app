import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:kifuliiru_app/abaami.dart';
import 'package:kifuliiru_app/bafuliiru.dart';
import 'package:kifuliiru_app/ibufuliiru.dart';
import 'package:kifuliiru_app/utwaya.dart';
import 'package:kifuliiru_app/amagambo.dart';
import 'package:kifuliiru_app/learning_screen.dart';
import 'package:kifuliiru_app/contribute_screen.dart';
import 'package:kifuliiru_app/diaspora_screen.dart';
import 'package:kifuliiru_app/teachers_screen.dart';
import 'dart:ui';

import 'about_screen.dart';
import 'add_words_screen.dart';
import 'study_tools_screen.dart';
import 'package:provider/provider.dart';
import 'package:kifuliiru_app/theme_provider.dart';
import 'package:kifuliiru_app/notifications_screen.dart';
import 'package:kifuliiru_app/profile_screen.dart';
import 'package:kifuliiru_app/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> _newsItems = [
    {
      'title': 'Muhumanano gwe misore yitu 2024',
      'description': 'Guno guliri muhumanano gwe misore ye Kifuliiru mu Amerika',
      'image': 'assets/images/kifuliiru.png',
    },
    {
      'title': 'Kifuliiru.net',
      'description': 'Twaloonga ugundi namuyehuulo mu Kifuliiru',
      'image': 'assets/images/kifuliiru.png',
    },
    {
      'title': 'Ibufuliiru.net',
      'description': 'Kibaaja kihyahya higulu lye Kifuliiru',
      'image': 'assets/images/kifuliiru.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      drawer: _buildDrawer(),
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 60.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            title: const Text(
              'Kifuliiru',
              style: TextStyle(
                color: Color(0xFFEA580C),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: const Color(0xFFEA580C),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFFEA580C),
                  child: Icon(Icons.person_outline, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.dark_mode_outlined),
                color: const Color(0xFFEA580C),
                onPressed: () {
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),

          // Welcome Message
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Welcome to Kifuliiru Hub - Your gateway to learning and preserving the Kifuliiru language and culture.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
          ),

          // Featured News Carousel
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 200,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(_newsItems[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _newsItems[index]['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _newsItems[index]['description']!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _newsItems.length,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Color(0xFFEA580C),
                    color: Colors.white54,
                  ),
                ),
                autoplay: true,
                autoplayDelay: 5000,
              ),
            ),
          ),

          // Language Learning Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kuyigira Kifuliiru',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all learning features
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFEA580C),
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn Kifuliiru through interactive lessons, exercises, and study tools.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Amagambo',
                          Icons.book,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DictionaryScreen(
                                title: 'Kifuliiru Dictionary',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Kuyigira',
                          Icons.school,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LearningScreen(
                                title: 'Learn Kifuliiru',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Study Tools',
                          Icons.build,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudyToolsScreen(
                                title: 'Study Tools',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Add Words',
                          Icons.add_circle,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddWordsScreen(
                                title: 'Add Words',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Culture & Heritage Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Culture & Heritage',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all cultural features
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFEA580C),
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore the rich cultural heritage and history of the Kifuliiru people.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Abaami',
                          Icons.people,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KingsScreen(
                                title: 'Royal Lineage',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Ibufuliiru',
                          Icons.language,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomelandScreen(
                                title: 'Ibufuliiru - Our Homeland',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Bafuliiru',
                          Icons.group,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BafuliiruScreen(
                                title: 'Bafuliiru',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Utwaya',
                          Icons.history,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VillagesScreen(
                                title: 'Utwaya',
                              ),
                            ),
                          ),
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Communauté',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all community features
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFEA580C),
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connect with the Kifuliiru community and contribute to our language preservation.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFeatureCard(
                          context,
                          'Diaspora',
                          Icons.public,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiasporaScreen(),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Contribute',
                          Icons.add_circle,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContributeScreen(
                                title: 'Contribute',
                              ),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'Teachers',
                          Icons.people_outline,
                          const Color(0xFFEA580C),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeachersScreen(),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          context,
                          'About',
                          Icons.info,
                          const Color(0xFFEF4444),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutScreen(
                                title: 'About',
                              ),
                            ),
                          ),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor: const Color(0xFFEA580C).withOpacity(0.2),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (index) {
            // Handle navigation
            switch (index) {
              case 0:
                // Already on home
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DictionaryScreen(
                      title: 'Kifuliiru Dictionary',
                    ),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LearningScreen(
                      title: 'Learn Kifuliiru',
                    ),
                  ),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KingsScreen(
                      title: 'Royal Lineage',
                    ),
                  ),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomelandScreen(
                      title: 'Ibufuliiru - Our Homeland',
                    ),
                  ),
                );
                break;
            }
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Dictionary',
            ),
            NavigationDestination(
              icon: Icon(Icons.school_outlined),
              selectedIcon: Icon(Icons.school),
              label: 'Learn',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: 'Abaami',
            ),
            NavigationDestination(
              icon: Icon(Icons.language_outlined),
              selectedIcon: Icon(Icons.language),
              label: 'Ibufuliiru',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Kifuliiru Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Preserve • Learn • Share',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode, color: Color(0xFFEA580C)),
            title: const Text(
              'Dark Mode',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
            onTap: () {
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme();
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            icon: Icons.book,
            title: 'Dictionary',
            description: 'Search and learn Kifuliiru words and phrases',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DictionaryScreen(
                  title: 'Kifuliiru Dictionary',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.school,
            title: 'Learn',
            description: 'Interactive lessons and exercises',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LearningScreen(
                  title: 'Learn Kifuliiru',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.people,
            title: 'Abaami',
            description: 'Explore the royal lineage and history',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const KingsScreen(
                  title: 'Royal Lineage',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.language,
            title: 'Ibufuliiru',
            description: 'Discover our homeland and culture',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomelandScreen(
                  title: 'Ibufuliiru - Our Homeland',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.group,
            title: 'Bafuliiru',
            description: 'Learn about our people and traditions',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BafuliiruScreen(
                  title: 'Bafuliiru',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.history,
            title: 'Utwaya',
            description: 'Explore our villages and history',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VillagesScreen(
                  title: 'Utwaya',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.public,
            title: 'Diaspora',
            description: 'Connect with Kifuliiru community worldwide',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DiasporaScreen(),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.add_circle,
            title: 'Contribute',
            description: 'Help preserve and expand our language',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContributeScreen(
                  title: 'Contribute',
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.people_outline,
            title: 'Teachers',
            description: 'Find and connect with Kifuliiru teachers',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeachersScreen(),
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.info,
            title: 'About',
            description: 'Learn about the Kifuliiru Hub project',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AboutScreen(
                  title: 'About',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: KifuliiruTheme.primaryColor),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: theme.textTheme.bodyLarge?.color,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 12,
          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
