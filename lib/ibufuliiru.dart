import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

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
    final theme = Theme.of(context);
    
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFEA580C), Color(0xFFEF4444)],
                  ).createShader(bounds),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                      child: Center(
                        child: Icon(
                          Icons.landscape,
                          size: 80,
                          color: KifuliiruTheme.primaryColor.withOpacity(0.3),
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
                            Colors.black.withOpacity(0.3),
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
                  labelColor: KifuliiruTheme.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: KifuliiruTheme.primaryColor,
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
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: KifuliiruTheme.primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: KifuliiruTheme.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyFacts() {
    final theme = Theme.of(context);
    final List<Map<String, String>> facts = [
      {'title': 'Population', 'value': '500,000+'},
      {'title': 'Main City', 'value': 'Uvira'},
      {'title': 'Languages', 'value': 'Kifuliiru, Swahili'},
      {'title': 'Climate', 'value': 'Tropical'},
    ];

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Facts',
              style: theme.textTheme.titleMedium?.copyWith(
                color: KifuliiruTheme.textColor,
                fontWeight: FontWeight.w600,
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
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            fact['value']!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: KifuliiruTheme.primaryColor,
                              fontWeight: FontWeight.w500,
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
    final theme = Theme.of(context);
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
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      feature['icon'] as IconData,
                      color: KifuliiruTheme.primaryColor,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    feature['name'] as String,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: KifuliiruTheme.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    feature['description'] as String,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
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
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 32,
                color: KifuliiruTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall?.copyWith(
                color: KifuliiruTheme.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLandmarksList() {
    final theme = Theme.of(context);
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
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        landmark['name']!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: KifuliiruTheme.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        landmark['description']!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            landmark['location']!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
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
