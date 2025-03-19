import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      KifuliiruTheme.primaryColor,
                      KifuliiruTheme.secondaryColor,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Account Settings'),
                  _buildProfileOption(
                    icon: Icons.person,
                    title: 'Edit Profile',
                    onTap: () {
                      // Navigate to edit profile
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // Navigate to change password
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.notifications,
                    title: 'Notification Settings',
                    onTap: () {
                      // Navigate to notification settings
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.language,
                    title: 'Language Preferences',
                    onTap: () {
                      // Navigate to language settings
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('App Settings'),
                  _buildProfileOption(
                    icon: Icons.storage,
                    title: 'Storage & Data',
                    onTap: () {
                      // Navigate to storage settings
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {
                      // Navigate to help center
                    },
                  ),
                  _buildProfileOption(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      // Navigate to about page
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Account'),
                  _buildProfileOption(
                    icon: Icons.logout,
                    title: 'Sign Out',
                    onTap: () {
                      // Handle sign out
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: KifuliiruTheme.primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 