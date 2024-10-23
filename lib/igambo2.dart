// igambo.dart
class Igambo {
  String? igambo;
  String? kiswahili;
  String? francais;
  String? english;
  String? phonetic;
  String? partOfSpeech;
  List<String>? examples;
  List<String>? synonyms;

  Igambo({
    this.igambo,
    this.kiswahili,
    this.francais,
    this.english,
    this.phonetic,
    this.partOfSpeech,
    this.examples,
    this.synonyms,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
      igambo: json['igambo'],
      kiswahili: json['kiswahili'],
      francais: json['francais'],
      english: json['english'],
      phonetic: json['phonetic'],
      partOfSpeech: json['partOfSpeech'],
      examples: List<String>.from(json['examples'] ?? []),
      synonyms: List<String>.from(json['synonyms'] ?? []),
    );
  }
}
