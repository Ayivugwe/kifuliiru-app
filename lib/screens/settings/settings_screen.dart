import 'package:flutter/material.dart';
import '../../theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: KifuliiruTheme.primaryColor,
      ),
      body: ListView(
        children: [
          _buildSection(
            'Account',
            [
              _buildSettingTile(
                'Profile',
                'Manage your account information',
                Icons.person_outline,
                () {},
              ),
              _buildSettingTile(
                'Notifications',
                'Configure notification preferences',
                Icons.notifications_outlined,
                () {},
              ),
              _buildSettingTile(
                'Privacy',
                'Manage your privacy settings',
                Icons.lock_outline,
                () {},
              ),
            ],
          ),
          _buildSection(
            'App Settings',
            [
              _buildSettingTile(
                'Language',
                'Change app language',
                Icons.language,
                () {},
              ),
              _buildSettingTile(
                'Theme',
                'Customize app appearance',
                Icons.palette_outlined,
                () {},
              ),
              _buildSettingTile(
                'Storage',
                'Manage app storage',
                Icons.storage_outlined,
                () {},
              ),
            ],
          ),
          _buildSection(
            'Support',
            [
              _buildSettingTile(
                'Help Center',
                'Get help and support',
                Icons.help_outline,
                () {},
              ),
              _buildSettingTile(
                'Contact Us',
                'Get in touch with us',
                Icons.contact_support_outlined,
                () {},
              ),
              _buildSettingTile(
                'About',
                'App information and version',
                Icons.info_outline,
                () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildSettingTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 