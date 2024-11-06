import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:kifuliiru_app/abaami.dart';
import 'package:kifuliiru_app/bafuliiru.dart';
import 'package:kifuliiru_app/ibufuliiru.dart';
import 'package:kifuliiru_app/utwaya.dart';
import 'dart:ui';

import 'about_screen.dart';
import 'add_words_screen.dart';
import 'amagambo.dart';
import 'contribute_screen.dart';
import 'diaspora_screen.dart';
import 'learning_screen.dart';
import 'study_tools_screen.dart';
import 'teachers_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int _currentNewsIndex = 0;
  final List<Map<String, String>> _newsItems = [
    {
      'title': 'Muhumanano gwe misore yitu 2024',
      'description':
          'Guno guliri muhumanano gwe misore ye Kifuliiru mu Amerika',
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
    // Add more news items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kifuliiru - Ibufuliiru - Abafuliiru',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 25, 248),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            _buildNewsCarousel(),
            _buildSectionTitle('Akalaga kitu'),
            _buildCulturalHeritageGrid(),
            _buildSectionTitle('Kifuliiru'),
            _buildLanguageResourcesGrid(),
            _buildSectionTitle('Communauté'),
            _buildCommunityGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return const Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muyegerere ku kibaaja kye Kifuliiru',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tuliri Bafuliiru, tumusima i Kifuliiru. Kibaaja kitu kino.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Handle news item tap
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 1.5, // Adjust blur intensity here
                            sigmaY: 1.5,
                          ),
                          child: Image(
                            image: AssetImage(_newsItems[index]['image']!),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
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
                              Text(
                                _newsItems[index]['description']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _newsItems.length,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blue,
                color: Colors.grey,
              ),
            ),
            autoplay: true,
            autoplayDelay: 3000,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C4356),
        ),
      ),
    );
  }

  Widget _buildGridButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCulturalHeritageGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.account_balance,
          title: 'Bafuliiru',
          color: Colors.brown,
          onPressed: () => _handleNavigation('bafuliiru'),
        ),
        _buildGridButton(
          //Removed Icons.crown
          icon: Icons.person,
          title: 'Abaami',
          color: Colors.amber,
          onPressed: () => _handleNavigation('kings'),
        ),
        _buildGridButton(
          icon: Icons.location_on,
          title: 'Ibufuliiru',
          color: Colors.pink,
          onPressed: () => _handleNavigation('ibufuliiru'),
        ),
        _buildGridButton(
          icon: Icons.house,
          title: 'Utwaya',
          color: Colors.green,
          onPressed: () => _handleNavigation('villages'),
        ),
      ],
    );
  }

  Widget _buildLanguageResourcesGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.book,
          title: 'Kifuliiru',
          color: Colors.blue,
          onPressed: () => _handleNavigation('dictionary'),
        ),
        _buildGridButton(
          icon: Icons.book,
          title: 'Sobaanura',
          color: Colors.blue,
          onPressed: () => _handleNavigation('dictionary'),
        ),
        _buildGridButton(
          icon: Icons.school,
          title: 'Tusome',
          color: Colors.purple,
          onPressed: () => _handleNavigation('learn'),
        ),
        _buildGridButton(
          icon: Icons.person,
          title: 'Abaalimu',
          color: Colors.orange,
          onPressed: () => _handleNavigation('teachers'),
        ),
        _buildGridButton(
          icon: Icons.build,
          title: 'Soma',
          color: Colors.teal,
          onPressed: () => _handleNavigation('study_tools'),
        ),
      ],
    );
  }

  Widget _buildCommunityGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildGridButton(
          icon: Icons.public,
          title: 'Imahaanga',
          color: Colors.green,
          onPressed: () => _handleNavigation('diaspora'),
        ),
        _buildGridButton(
          icon: Icons.add_circle,
          title: 'Tugwaase',
          color: Colors.blue,
          onPressed: () => _handleNavigation('add_words'),
        ),
        _buildGridButton(
          icon: Icons.volunteer_activism,
          title: 'Tutabaale',
          color: Colors.orange,
          onPressed: () => _handleNavigation('contribute'),
        ),
        _buildGridButton(
          icon: Icons.info,
          title: 'Twehe',
          color: Colors.purple,
          onPressed: () => _handleNavigation('about'),
        ),
      ],
    );
  }

  void _handleNavigation(String route) {
    switch (route) {
      // Cultural Heritage
      case 'bafuliiru':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BafuliiruScreen(
              title: 'Bafuliiru History & People',
            ),
          ),
        );
        break;
      case 'kings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const KingsScreen(
              title: 'Royal Lineage',
            ),
          ),
        );
        break;
      case 'ibufuliiru':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomelandScreen(
              title: 'Ibufuliiru - Our Homeland',
            ),
          ),
        );
        break;
      case 'villages':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VillagesScreen(
              title: 'Villages & Towns',
            ),
          ),
        );
        break;

      // Language Resources
      case 'dictionary':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DictionaryScreen(
              title: 'Kifuliiru Dictionary',
            ),
          ),
        );
        break;
      case 'learn':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LearningScreen(
              title: 'Learn Kifuliiru',
            ),
          ),
        );
        break;
      case 'teachers':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeachersScreen(),
          ),
        );
        break;
      case 'study_tools':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudyToolsScreen(
              title: 'Study Tools',
            ),
          ),
        );
        break;

      // Community
      case 'diaspora':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DiasporaScreen(),
          ),
        );
        break;
      case 'add_words':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddWordsScreen(
              title: 'Yongera amagambo',
            ),
          ),
        );
        break;
      case 'contribute':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ContributeScreen(
              title: 'Tabaala',
            ),
          ),
        );
        break;
      case 'about':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AboutScreen(
              title: 'About Kifuliiru',
            ),
          ),
        );
        break;
      default:
        debugPrint('Unknown route: $route');
    }
  }
}
