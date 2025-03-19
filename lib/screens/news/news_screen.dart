import 'package:flutter/material.dart';
import '../../theme.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Culture',
    'Community',
    'Events',
    'Education',
    'Language',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60.0,
            floating: false,
            pinned: true,
            title: const Text(
              'News',
              style: TextStyle(
                color: KifuliiruTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Categories Tab Bar
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: KifuliiruTheme.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: KifuliiruTheme.primaryColor,
                    tabs: _categories.map((category) => Tab(text: category)).toList(),
                    onTap: (index) {
                      setState(() {
                        _selectedCategory = _categories[index];
                      });
                    },
                  ),
                ),
                // News Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildNewsCard(
                        context,
                        'Cultural Festival Success',
                        'The annual Fuliiru cultural festival brings together communities from around the world',
                        '2 hours ago',
                        'Culture',
                        'https://example.com/image1.jpg',
                        'John Doe',
                        'The annual Fuliiru cultural festival was a resounding success this year, bringing together communities from around the world to celebrate our rich heritage. The event featured traditional performances, workshops, and exhibitions showcasing various aspects of Fuliiru culture. Participants had the opportunity to learn about traditional dances, music, and crafts, while also engaging in meaningful discussions about preserving our cultural heritage for future generations.',
                      ),
                      const SizedBox(height: 16),
                      _buildNewsCard(
                        context,
                        'New Language Learning Program',
                        'Launch of a new initiative to teach Kifuliiru to the next generation',
                        '5 hours ago',
                        'Education',
                        'https://example.com/image2.jpg',
                        'Jane Smith',
                        'A new initiative has been launched to teach Kifuliiru to the next generation. The program aims to make language learning more accessible and engaging through modern teaching methods and technology. The curriculum includes interactive lessons, cultural context, and practical conversation practice. This initiative represents a significant step forward in preserving and promoting the Kifuliiru language.',
                      ),
                      const SizedBox(height: 16),
                      _buildNewsCard(
                        context,
                        'Community Meeting',
                        'Monthly community meeting to discuss cultural preservation',
                        '1 day ago',
                        'Community',
                        'https://example.com/image3.jpg',
                        'Mike Johnson',
                        'The monthly community meeting focused on strategies for cultural preservation. Members discussed various initiatives, including documenting oral histories, organizing cultural workshops, and creating digital resources. The meeting highlighted the importance of community involvement in preserving our cultural heritage and ensuring its transmission to future generations.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context,
    String title,
    String description,
    String time,
    String category,
    String imageUrl,
    String author,
    String content,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(
              title: title,
              description: description,
              content: content,
              time: time,
              category: category,
              imageUrl: imageUrl,
              author: author,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48,
                  color: KifuliiruTheme.primaryColor.withOpacity(0.3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category and Time
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: KifuliiruTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: KifuliiruTheme.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Read More Button
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            title: title,
                            description: description,
                            content: content,
                            time: time,
                            category: category,
                            imageUrl: imageUrl,
                            author: author,
                          ),
                        ),
                      );
                    },
                    child: const Text('Read More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 