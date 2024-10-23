import 'package:flutter/material.dart';

class VillagesScreen extends StatefulWidget {
  final String title;

  const VillagesScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<VillagesScreen> createState() => _VillagesScreenState();
}

class _VillagesScreenState extends State<VillagesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Sample villages data - replace with actual data
  final List<Map<String, String>> _villages = [
    {
      'name': 'Luvungi',
      'chief': 'Mwami Ndare',
      'population': '15,000',
      'description':
          'A historic village known for its traditional markets and cultural ceremonies. Located along the main trade route.',
      'features': 'Traditional market, Cultural center, Ancient tree shrine',
      'location': 'Central Uvira Territory',
    },
    {
      'name': 'Sange',
      'chief': 'Mwami Kabego',
      'population': '12,500',
      'description':
          'Agricultural center famous for its fertile lands and traditional farming practices.',
      'features': 'Agricultural center, Weekly market, Community center',
      'location': 'Southern Uvira Territory',
    },
    {
      'name': 'Lemera',
      'chief': 'Mwami Lukogo',
      'population': '8,000',
      'description':
          'Mountain village renowned for its healing springs and traditional medicine practitioners.',
      'features':
          'Healing springs, Traditional medicine center, Mountain views',
      'location': 'Eastern Highlands',
    },
    {
      'name': 'Kibogoye',
      'chief': 'Mwami Bisimwa',
      'population': '6,500',
      'description':
          'Artisanal village known for its skilled craftsmen and traditional pottery.',
      'features': 'Pottery workshops, Artisan market, Cultural museum',
      'location': 'Northern Uvira Territory',
    },
  ];

  List<Map<String, String>> get _filteredVillages {
    if (_searchQuery.isEmpty) {
      return _villages;
    }
    return _villages.where((village) {
      final searchLower = _searchQuery.toLowerCase();
      final nameLower = village['name']?.toLowerCase() ?? '';
      final chiefLower = village['chief']?.toLowerCase() ?? '';
      final descriptionLower = village['description']?.toLowerCase() ?? '';

      return nameLower.contains(searchLower) ||
          chiefLower.contains(searchLower) ||
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
            child: _buildVillagesList(),
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
          hintText: 'Search villages...',
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

  Widget _buildVillagesList() {
    if (_filteredVillages.isEmpty) {
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
              'No villages found matching "$_searchQuery"',
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
      itemCount: _filteredVillages.length,
      itemBuilder: (context, index) {
        final village = _filteredVillages[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _showVillageDetails(village),
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C4356).withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.location_city,
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
                        village['name']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C4356),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Chief: ${village['chief']!}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        village['description']!,
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

  void _showVillageDetails(Map<String, String> village) {
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
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C4356).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_city,
                  size: 80,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                village['name']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Chief: ${village['chief']!}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailItem('Population', village['population']!),
              _buildDetailItem('Location', village['location']!),
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
                village['description']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                village['features']!,
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

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
