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
    return Igambo(
      word: json['word'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'definition': definition,
      'example': example,
      'notes': notes,
    };
  }
}
