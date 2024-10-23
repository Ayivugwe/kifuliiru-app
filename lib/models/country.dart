// models/country.dart
class Country {
  final String name;
  final String code;
  final List<String> states;
  final bool hasStates;

  Country({
    required this.name,
    required this.code,
    this.states = const [],
    this.hasStates = false,
  });
}
