// diaspora_screen.dart
import 'package:flutter/material.dart';

class DiasporaScreen extends StatelessWidget {
  final String title;
  const DiasporaScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diaspora'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCommunitySection('Find Communities'),
          const SizedBox(height: 20),
          _buildEventsSection('Upcoming Events'),
          const SizedBox(height: 20),
          _buildResourcesSection('Resources'),
        ],
      ),
    );
  }

  Widget _buildCommunitySection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: 200,
                  child: ListTile(
                    title: Text('Community ${index + 1}'),
                    subtitle: const Text('Location • Members'),
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEventsSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Card(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.event),
                title: Text('Event ${index + 1}'),
                subtitle: const Text('Date • Location'),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildResourcesSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.article),
                title: const Text('Cultural Resources'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Community Guidelines'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Support'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
