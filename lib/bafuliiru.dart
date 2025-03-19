import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

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
                          Icons.people,
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
          content: 'The Bafuliiru people have a rich history dating back centuries...',
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
          content: 'The Bafuliiru people maintain strong cultural traditions...',
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
          content: 'The Bafuliiru language belongs to the Bantu language family...',
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
      {'title': 'Region', 'value': 'Eastern DRC'},
      {'title': 'Language', 'value': 'Kifuliiru'},
      {'title': 'Major Cities', 'value': 'Uvira, Lemera'},
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
            ...facts.map((fact) => Padding(
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
                )),
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
      children: features.map((feature) => Card(
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
          )).toList(),
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
