// about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String title;

  const AboutScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.app_shortcut, size: 50),
          ),
          const SizedBox(height: 16),
          const Text(
            'App Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Version 1.0.0',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description of the app and its mission goes here. This can be multiple lines of text explaining the purpose and goals of the application.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoTile('Contact Us', Icons.email),
          _buildInfoTile('Privacy Policy', Icons.privacy_tip),
          _buildInfoTile('Terms of Service', Icons.description),
          _buildInfoTile('Licenses', Icons.copyright),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
