import 'package:flutter/material.dart';

class HomelandScreen extends StatefulWidget {
  final String title;

  const HomelandScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomelandScreen> createState() => _HomelandScreenState();
}

class _HomelandScreenState extends State<HomelandScreen>
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
                          Icons.landscape,
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
                    Tab(text: 'Overview'),
                    Tab(text: 'Geography'),
                    Tab(text: 'Culture'),
                    Tab(text: 'Landmarks'),
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
            _buildOverviewTab(),
            _buildGeographyTab(),
            _buildCultureTab(),
            _buildLandmarksTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'About Ibufuliiru',
          content:
              'Ibufuliiru is the ancestral homeland of the Bafuliiru people, located in the South Kivu province of the Democratic Republic of the Congo. This region has been home to our people for generations, featuring rich cultural heritage and natural beauty.',
          icon: Icons.home,
        ),
        const SizedBox(height: 16),
        _buildKeyFacts(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Historical Significance',
          content:
              'For centuries, Ibufuliiru has been the center of Bafuliiru civilization, playing a crucial role in the development of our cultural identity, traditional practices, and social structures.',
          icon: Icons.history,
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
          content:
              'Situated in the eastern region of DRC, Ibufuliiru spans across rolling hills, valleys, and plateaus. The region is characterized by its diverse landscape and fertile soil.',
          icon: Icons.location_on,
        ),
        const SizedBox(height: 16),
        _buildGeographicalFeatures(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Climate',
          content:
              'The region enjoys a tropical climate with distinct wet and dry seasons, supporting agriculture and traditional farming practices.',
          icon: Icons.wb_sunny,
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
              'The land is deeply intertwined with Bafuliiru cultural practices, traditions, and spiritual beliefs. Sacred sites and traditional gathering places dot the landscape.',
          icon: Icons.people,
        ),
        const SizedBox(height: 16),
        _buildCulturalPractices(),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Traditional Activities',
          content:
              'The region supports various traditional activities including farming, cattle raising, and cultural ceremonies that have been passed down through generations.',
          icon: Icons.agriculture,
        ),
      ],
    );
  }

  Widget _buildLandmarksTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildLandmarksList(),
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
      {'title': 'Main City', 'value': 'Uvira'},
      {'title': 'Languages', 'value': 'Kifuliiru, Swahili'},
      {'title': 'Climate', 'value': 'Tropical'},
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
        'description': 'Home to significant mountain ranges and hills',
        'icon': Icons.terrain,
      },
      {
        'name': 'Rivers',
        'description': 'Several major rivers flow through the region',
        'icon': Icons.waves,
      },
      {
        'name': 'Valleys',
        'description': 'Fertile valleys support agriculture and settlements',
        'icon': Icons.landscape,
      },
      {
        'name': 'Forests',
        'description': 'Protected forest areas preserve biodiversity',
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

  Widget _buildLandmarksList() {
    final List<Map<String, String>> landmarks = [
      {
        'name': 'Royal Palace',
        'description': 'Historical seat of Bafuliiru kings',
        'location': 'Uvira',
      },
      {
        'name': 'Sacred Forest',
        'description': 'Traditional spiritual site',
        'location': 'Lemera',
      },
      {
        'name': 'Cultural Center',
        'description': 'Museum and cultural preservation site',
        'location': 'Luvungi',
      },
      {
        'name': 'Ancient Market',
        'description': 'Traditional trading center',
        'location': 'Sange',
      },
    ];

    return Column(
      children: landmarks
          .map((landmark) => Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        landmark['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C4356),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        landmark['description']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            landmark['location']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
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
