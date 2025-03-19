import 'package:flutter/material.dart';
import 'package:kifuliiru_app/theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to notification settings
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual notification count
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: KifuliiruTheme.primaryColor.withOpacity(0.1),
              child: Icon(
                _getNotificationIcon(index),
                color: KifuliiruTheme.primaryColor,
              ),
            ),
            title: Text(_getNotificationTitle(index)),
            subtitle: Text(_getNotificationDescription(index)),
            trailing: Text(_getNotificationTime(index)),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }

  IconData _getNotificationIcon(int index) {
    switch (index % 4) {
      case 0:
        return Icons.notifications;
      case 1:
        return Icons.event;
      case 2:
        return Icons.message;
      default:
        return Icons.info;
    }
  }

  String _getNotificationTitle(int index) {
    switch (index % 4) {
      case 0:
        return 'New Word Added';
      case 1:
        return 'Upcoming Event';
      case 2:
        return 'New Message';
      default:
        return 'System Update';
    }
  }

  String _getNotificationDescription(int index) {
    switch (index % 4) {
      case 0:
        return 'A new word has been added to the dictionary';
      case 1:
        return 'Join us for the Kifuliiru language workshop';
      case 2:
        return 'You have a new message from a community member';
      default:
        return 'The app has been updated with new features';
    }
  }

  String _getNotificationTime(int index) {
    switch (index % 4) {
      case 0:
        return '2m ago';
      case 1:
        return '1h ago';
      case 2:
        return '3h ago';
      default:
        return '1d ago';
    }
  }
} 