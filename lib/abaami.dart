import 'package:flutter/material.dart';

class KingsScreen extends StatefulWidget {
  final String title;

  const KingsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<KingsScreen> createState() => _BafuliiruLeadersScreenState();
}

class _BafuliiruLeadersScreenState extends State<KingsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, String>> _leaders = [
    {
      'name': 'Chief Mokogabwe',
      'period': '1850 - 1880',
      'description':
          'A visionary leader who unified various Bafuliiru communities and established key alliances.',
      'achievements':
          'Created the first formal council system, established trade networks, and promoted cultural preservation',
      'image': 'assets/leaders/mokogabwe.jpg'
    },
    {
      'name': 'Chief Mushakulu',
      'period': '1880 - 1910',
      'description':
          'Led during a period of significant change and protected Bafuliiru interests.',
      'achievements':
          'Maintained independence during colonial pressures, built first community centers, preserved traditional laws',
      'image': 'assets/leaders/mushakulu.jpg'
    },
    {
      'name': 'Chief Nyamugira',
      'period': '1910 - 1940',
      'description':
          'Known for his diplomatic skills and educational initiatives.',
      'achievements':
          'Established first schools, strengthened traditional governance, promoted peace with neighbors',
      'image': 'assets/leaders/nyamugira.jpg'
    },
  ];

  List<Map<String, String>> get _filteredLeaders {
    if (_searchQuery.isEmpty) {
      return _leaders;
    }
    return _leaders.where((leader) {
      final searchLower = _searchQuery.toLowerCase();
      final nameLower = leader['name']?.toLowerCase() ?? '';
      final periodLower = leader['period']?.toLowerCase() ?? '';
      final descriptionLower = leader['description']?.toLowerCase() ?? '';

      return nameLower.contains(searchLower) ||
          periodLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C4356),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchHeader(),
          Expanded(
            child: _buildLeadersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      color: const Color(0xFF2C4356),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search leaders...',
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white70),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildLeadersList() {
    if (_filteredLeaders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No leaders found matching "$_searchQuery"',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredLeaders.length,
      itemBuilder: (context, index) {
        final leader = _filteredLeaders[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _showLeaderDetails(leader),
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C4356).withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 64,
                      color: Color(0xFF2C4356),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leader['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C4356),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        leader['period'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        leader['description'] ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
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
        );
      },
    );
  }

  void _showLeaderDetails(Map<String, String> leader) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: controller,
            padding: const EdgeInsets.all(24),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C4356).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                leader['name'] ?? '',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                leader['period'] ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                leader['description'] ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                leader['achievements'] ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
