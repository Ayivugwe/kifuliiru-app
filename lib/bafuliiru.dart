import 'package:flutter/material.dart';

class BafuliiruScreen extends StatefulWidget {
  final String title;

  const BafuliiruScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<BafuliiruScreen> createState() => _BafuliiruScreenState();
}

class _BafuliiruScreenState extends State<BafuliiruScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: const Color(0xFF2C4356),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: const Color(0xFF2C4356),
                      child: const Center(
                        child: Icon(
                          Icons.people,
                          size: 80,
                          color: Colors.white24,
                        ),
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
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: const Color(0xFF2C4356),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF2C4356),
                  tabs: const [
                    Tab(text: 'History'),
                    Tab(text: 'Culture'),
                    Tab(text: 'Geography'),
                    Tab(text: 'Language'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildHistoryTab(),
            _buildCultureTab(),
            _buildGeographyTab(),
            _buildLanguageTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'Historical Background',
          content:
              'The Bafuliiru people have a rich history dating back centuries...',
          icon: Icons.history,
        ),
        const SizedBox(height: 16),
        _buildKeyFacts(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Timeline',
          content: 'Key historical events and developments...',
          icon: Icons.timeline,
        ),
      ],
    );
  }

  Widget _buildCultureTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'Cultural Heritage',
          content:
              'The Bafuliiru people maintain strong cultural traditions...',
          icon: Icons.people,
        ),
        const SizedBox(height: 16),
        _buildCulturalPractices(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Traditions',
          content: 'Important ceremonies and celebrations...',
          icon: Icons.celebration,
        ),
      ],
    );
  }

  Widget _buildGeographyTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'Location',
          content: 'The Bafuliiru people primarily inhabit...',
          icon: Icons.location_on,
        ),
        const SizedBox(height: 16),
        _buildGeographicalFeatures(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Climate',
          content: 'The natural environment and climate...',
          icon: Icons.wb_sunny,
        ),
      ],
    );
  }

  Widget _buildLanguageTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'Linguistics',
          content:
              'The Bafuliiru language belongs to the Bantu language family...',
          icon: Icons.record_voice_over,
        ),
        const SizedBox(height: 16),
        _buildLanguageFeatures(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Dialects',
          content: 'Various regional dialects and variations...',
          icon: Icons.translate,
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF2C4356),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C4356),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyFacts() {
    final List<Map<String, String>> facts = [
      {'title': 'Population', 'value': '500,000+'},
      {'title': 'Region', 'value': 'Eastern DRC'},
      {'title': 'Language', 'value': 'Kifuliiru'},
      {'title': 'Major Cities', 'value': 'Uvira, Lemera'},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Facts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4356),
              ),
            ),
            const SizedBox(height: 16),
            ...facts
                .map((fact) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fact['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            fact['value']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2C4356),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildGeographicalFeatures() {
    final List<Map<String, dynamic>> features = [
      {
        'name': 'Mountains',
        'description': 'Home to significant mountain ranges',
        'icon': Icons.terrain,
      },
      {
        'name': 'Rivers',
        'description': 'Major river systems',
        'icon': Icons.waves,
      },
      {
        'name': 'Valleys',
        'description': 'Fertile valleys and plains',
        'icon': Icons.landscape,
      },
      {
        'name': 'Forests',
        'description': 'Dense forest regions',
        'icon': Icons.forest,
      },
    ];

    return Column(
      children: features
          .map((feature) => Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    feature['icon'] as IconData,
                    color: const Color(0xFF2C4356),
                    size: 32,
                  ),
                  title: Text(
                    feature['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C4356),
                    ),
                  ),
                  subtitle: Text(
                    feature['description'] as String,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCulturalPractices() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _buildCultureCard('Traditional Dance', Icons.music_note),
        _buildCultureCard('Ceremonies', Icons.celebration),
        _buildCultureCard('Crafts', Icons.brush),
        _buildCultureCard('Storytelling', Icons.book),
      ],
    );
  }

  Widget _buildCultureCard(String title, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFF2C4356),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C4356),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageFeatures() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _buildCultureCard('Oral Traditions', Icons.record_voice_over),
        _buildCultureCard('Writing System', Icons.edit),
        _buildCultureCard('Regional Variations', Icons.public),
        _buildCultureCard('Modern Usage', Icons.phone_android),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
