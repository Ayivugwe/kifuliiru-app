// lib/models/igambo.dart
class Igambo {
  final String word;
  final String definition;
  final String? example;
  final String? notes;

  Igambo({
    required this.word,
    required this.definition,
    this.example,
    this.notes,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    // Handle potential null values by providing default empty strings
    final word = json['word'];
    final definition = json['definition'];

    return Igambo(
      word: word == null ? '' : word.toString(),
      definition: definition == null ? '' : definition.toString(),
      example: json['example']?.toString(),
      notes: json['notes']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'definition': definition,
        if (example != null) 'example': example,
        if (notes != null) 'notes': notes,
      };
}
