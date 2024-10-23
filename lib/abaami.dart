import 'package:flutter/material.dart';

class KingsScreen extends StatefulWidget {
  final String title;

  const KingsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<KingsScreen> createState() => _KingsScreenState();
}

class _KingsScreenState extends State<KingsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Sample kings data - replace with actual historical data
  final List<Map<String, String>> _kings = [
    {
      'name': 'Mwami Ndare I',
      'period': '1780 - 1820',
      'description':
          'Founded the Bafuliiru kingdom and established the first royal court.',
      'achievements':
          'United the Bafuliiru clans, established trade routes with neighboring kingdoms',
      'image': 'assets/kings/ndare_1.jpg'
    },
    {
      'name': 'Mwami Kabare',
      'period': '1820 - 1855',
      'description':
          'Known for his diplomatic skills and expansion of the kingdom.',
      'achievements':
          'Built the first royal palace, created the council of elders',
      'image': 'assets/kings/kabare.jpg'
    },
    {
      'name': 'Mwami Muganga',
      'period': '1855 - 1890',
      'description': 'Led during the challenging period of colonial contact.',
      'achievements':
          'Protected Bafuliiru culture, established education system',
      'image': 'assets/kings/muganga.jpg'
    },
    // Add more kings with their historical information
  ];

  List<Map<String, String>> get _filteredKings {
    if (_searchQuery.isEmpty) {
      return _kings;
    }
    return _kings.where((king) {
      final searchLower = _searchQuery.toLowerCase();
      final nameLower = king['name']?.toLowerCase() ?? '';
      final periodLower = king['period']?.toLowerCase() ?? '';
      final descriptionLower = king['description']?.toLowerCase() ?? '';

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
            child: _buildKingsList(),
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
          hintText: 'Search kings...',
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

  Widget _buildKingsList() {
    if (_filteredKings.isEmpty) {
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
              'No kings found matching "$_searchQuery"',
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
      itemCount: _filteredKings.length,
      itemBuilder: (context, index) {
        final king = _filteredKings[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => _showKingDetails(king),
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
                      Icons.account_balance,
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
                        king['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C4356),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        king['period'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        king['description'] ?? '',
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

  void _showKingDetails(Map<String, String> king) {
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
                  Icons.account_balance,
                  size: 80,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                king['name'] ?? '',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C4356),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                king['period'] ?? '',
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
                king['description'] ?? '',
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
                king['achievements'] ?? '',
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
