// models/buguma.dart
class Buguma {
  final String name;
  final String country;
  final String? state;
  final String description;
  final int membersCount;
  final String leaderName;
  final String contactInfo;
  final List<String> activities;

  Buguma({
    required this.name,
    required this.country,
    this.state,
    required this.description,
    required this.membersCount,
    required this.leaderName,
    required this.contactInfo,
    required this.activities,
  });
}
