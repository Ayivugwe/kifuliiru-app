// data/buguma_data.dart
import '../models/buguma.dart';

class BugumaData {
  static Map<String, List<Buguma>> communities = {
    'United States': [
      Buguma(
        name: 'Buguma New York City',
        country: 'United States',
        state: 'New York',
        description:
            'Vibrant community in the heart of NYC with regular cultural events and language classes.',
        membersCount: 250,
        leaderName: 'James Bisimwa',
        contactInfo: 'nyc@bugumausa.org',
        activities: [
          'Weekly meetings',
          'Cultural festivals',
          'Youth programs',
          'Language classes'
        ],
      ),
      Buguma(
        name: 'Buguma Texas',
        country: 'United States',
        state: 'Texas',
        description:
            'Growing community in Dallas-Fort Worth area focusing on cultural preservation.',
        membersCount: 150,
        leaderName: 'Sarah Mushagalusa',
        contactInfo: 'texas@bugumausa.org',
        activities: [
          'Monthly gatherings',
          'Traditional dance',
          'Community outreach'
        ],
      ),
      Buguma(
        name: 'Buguma California',
        country: 'United States',
        state: 'California',
        description:
            'Active community in the Bay Area with strong focus on youth development.',
        membersCount: 180,
        leaderName: 'Patrick Mushagalusa',
        contactInfo: 'california@bugumausa.org',
        activities: [
          'Youth mentorship',
          'Cultural events',
          'Business networking'
        ],
      ),
      Buguma(
        name: 'Buguma Minnesota',
        country: 'United States',
        state: 'Minnesota',
        description:
            'Close-knit community with emphasis on education and cultural preservation.',
        membersCount: 120,
        leaderName: 'Alice Nabintu',
        contactInfo: 'minnesota@bugumausa.org',
        activities: [
          'Educational programs',
          'Cultural preservation',
          'Community support'
        ],
      ),
      Buguma(
        name: 'Buguma Washington',
        country: 'United States',
        state: 'Washington',
        description:
            'Pacific Northwest community focused on cultural integration and support.',
        membersCount: 95,
        leaderName: 'David Kabuya',
        contactInfo: 'washington@bugumausa.org',
        activities: [
          'Social support',
          'Cultural events',
          'New member integration'
        ],
      ),
    ],
    'Canada': [
      Buguma(
        name: 'Buguma Toronto',
        country: 'Canada',
        state: 'Ontario',
        description:
            'Largest Bafuliiru community in Canada with diverse programs.',
        membersCount: 300,
        leaderName: 'Marie Nabushi',
        contactInfo: 'toronto@bugumacanada.org',
        activities: [
          'Cultural festivals',
          'Language preservation',
          'Youth programs'
        ],
      ),
      // Add more Canadian communities...
    ],
    'Belgium': [
      Buguma(
        name: 'Buguma Brussels',
        country: 'Belgium',
        state: 'Brussels Region', // Added region although not in original data
        description: 'Central European hub for Bafuliiru cultural activities.',
        membersCount: 400,
        leaderName: 'Pierre Mushagalusa',
        contactInfo: 'brussels@bugumabelgium.org',
        activities: [
          'European cultural exchange',
          'Community support',
          'Integration programs'
        ],
      ),
      // Add more Belgian communities...
    ],
  };

  static List<Buguma> getCommunitiesForCountry(String countryName) {
    return communities[countryName] ?? [];
  }
}
