import 'package:flutter/material.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imyazi mu Kifuliiru 2',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orangeAccent,
        fontFamily: 'Roboto', // Customize your font family here
      ),
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Map<String, String>> _newsList = [
    {
      'title': 'Breaking News',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Latest Update',
      'description': 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'image': 'https://via.placeholder.com/150',
    },
    // Add more news items here
  ];

  Future<void> _refreshNews() async {
    // Simulate fetching news data from an API
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Replace existing news list with new data
      _newsList = [
        {
          'title': 'New Breaking News',
          'description': 'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          'image': 'https://via.placeholder.com/150',
        },
        {
          'title': 'Updated Latest Update',
          'description': 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          'image': 'https://via.placeholder.com/150',
        },
        // Add more updated news items here
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNews,
        child: ListView.builder(
          itemCount: _newsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Image.network(
                    _newsList[index]['image'] ?? '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    _newsList[index]['title'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_newsList[index]['description'] ?? ''),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
