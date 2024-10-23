// screens/country_detail_screen.dart
import 'dart:math';

import 'package:flutter/material.dart';

import 'data/buguma_data.dart';
import 'models/buguma.dart';
import 'models/country.dart';

// screens/country_detail_screen.dart
class CountryDetailScreen extends StatefulWidget {
  final Country country;

  const CountryDetailScreen({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  String? _selectedState;
  List<Buguma> _communities = [];
  List<Buguma> _filteredCommunities = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCommunities();
  }

  Future<void> _loadCommunities() async {
    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    _communities = BugumaData.getCommunitiesForCountry(widget.country.name);
    if (_communities.isEmpty) {
      // If no communities exist, create placeholder data
      _communities = _generatePlaceholderCommunities();
    }
    _filteredCommunities = _communities;

    setState(() => _isLoading = false);
  }

  List<Buguma> _generatePlaceholderCommunities() {
    final random = Random();
    List<String> regions = widget.country.hasStates
        ? widget.country.states
        : ['Region 1', 'Region 2', 'Region 3', 'Region 4', 'Region 5'];

    return List.generate(5, (index) {
      String state = widget.country.hasStates
          ? regions[random.nextInt(regions.length)]
          : 'Province ${index + 1}';

      return Buguma(
        name: 'Buguma ${widget.country.name} ${index + 1}',
        country: widget.country.name,
        state: state,
        description: 'Active Bafuliiru community in ${widget.country.name}',
        membersCount: 50 + random.nextInt(200),
        leaderName: 'Community Leader ${index + 1}',
        contactInfo:
            'contact${index + 1}@buguma${widget.country.code.toLowerCase()}.org',
        activities: [
          'Cultural events',
          'Language classes',
          'Community support',
          'Youth programs'
        ],
      );
    });
  }

  void _filterCommunities(String query) {
    setState(() {
      _filteredCommunities = _communities.where((community) {
        final nameLower = community.name.toLowerCase();
        final stateLower = community.state?.toLowerCase() ?? '';
        final descriptionLower = community.description.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower) ||
            stateLower.contains(queryLower) ||
            descriptionLower.contains(queryLower);
      }).toList();
    });
  }

  void _filterByState(String? state) {
    setState(() {
      _selectedState = state;
      if (state == null) {
        _filteredCommunities = _communities;
      } else {
        _filteredCommunities = _communities
            .where((community) => community.state == state)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Communities in ${widget.country.name}'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: _filterCommunities,
                  decoration: InputDecoration(
                    hintText: 'Search communities...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                if (widget.country.hasStates) ...[
                  const SizedBox(height: 16),
                  _buildStateFilter(),
                ],
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildCommunityList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement new community registration
        },
        label: const Text('Register New Community'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStateFilter() {
    return DropdownButtonFormField<String>(
      value: _selectedState,
      decoration: InputDecoration(
        labelText: widget.country.hasStates
            ? 'Select State/Province'
            : 'Select Region',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('All Regions'),
        ),
        ...(widget.country.hasStates
                ? widget.country.states
                : ['Region 1', 'Region 2', 'Region 3', 'Region 4', 'Region 5'])
            .map((String? state) => DropdownMenuItem<String>(
                  value: state,
                  child: Text(state ?? 'All Regions'),
                ))
            .toList(),
      ],
      onChanged: _filterByState,
    );
  }

  Widget _buildCommunityList() {
    if (_filteredCommunities.isEmpty) {
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
              'No communities found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search or filters',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredCommunities.length,
      itemBuilder: (context, index) {
        final community = _filteredCommunities[index];
        return _CommunityCard(community: community);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class _CommunityCard extends StatelessWidget {
  final Buguma community;

  const _CommunityCard({
    Key? key,
    required this.community,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => _showCommunityDetails(context),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCommunityAvatar(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          community.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C4356),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          community.state ?? 'Region not specified',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildMembershipBadge(),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                community.description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              _buildInfoSection(),
              const SizedBox(height: 16),
              _buildActivitiesList(),
              const SizedBox(height: 16),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityAvatar() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF2C4356).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          community.name.substring(0, 1).toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C4356),
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people,
            size: 16,
            color: Colors.green,
          ),
          const SizedBox(width: 4),
          Text(
            '${community.membersCount}',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Row(
      children: [
        _buildInfoItem(
          Icons.person,
          'Leader',
          community.leaderName,
        ),
        const SizedBox(width: 16),
        _buildInfoItem(
          Icons.email,
          'Contact',
          community.contactInfo,
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesList() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: community.activities
          .take(3)
          .map(
            (activity) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF2C4356).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                activity,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2C4356),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () => _showContactInfo(context),
          icon: const Icon(Icons.message),
          label: const Text('Contact'),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF2C4356),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () => _joinCommunity(context),
          icon: const Icon(Icons.group_add),
          label: const Text('Join'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2C4356),
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  void _showCommunityDetails(BuildContext context) {
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
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: controller,
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
              _buildDetailedInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          community.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C4356),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          community.state ?? 'Region not specified',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'About',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C4356),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          community.description,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        // Add more detailed information as needed
      ],
    );
  }

  void _showContactInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Community Leader'),
              subtitle: Text(community.leaderName),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(community.contactInfo),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _joinCommunity(BuildContext context) {
    // Implement join community logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Join request sent to community leader'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
