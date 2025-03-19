class Igambo {
  final String id;
  final String title;
  final String? sobaanuro;
  final String? sobaanuroYeKiswahili;
  final String? sobaanuroYeKifaransa;
  final String? sobaanuroYeKingereza;
  final String? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Igambo({
    required this.id,
    required this.title,
    this.sobaanuro,
    this.sobaanuroYeKiswahili,
    this.sobaanuroYeKifaransa,
    this.sobaanuroYeKingereza,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      sobaanuro: json['sobaanuro'],
      sobaanuroYeKiswahili: json['sobaanuroYeKiswahili'],
      sobaanuroYeKifaransa: json['sobaanuroYeKifaransa'],
      sobaanuroYeKingereza: json['sobaanuroYeKingereza'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  factory Igambo.fromFirestore(String id, Map<String, dynamic> data) {
    return Igambo(
      id: id,
      title: data['title'] ?? '',
      sobaanuro: data['sobaanuro'],
      sobaanuroYeKiswahili: data['sobaanuroYeKiswahili'],
      sobaanuroYeKifaransa: data['sobaanuroYeKifaransa'],
      sobaanuroYeKingereza: data['sobaanuroYeKingereza'],
      category: data['category'],
      createdAt: (data['createdAt'] as DateTime).toLocal(),
      updatedAt: (data['updatedAt'] as DateTime).toLocal(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sobaanuro': sobaanuro,
      'sobaanuroYeKiswahili': sobaanuroYeKiswahili,
      'sobaanuroYeKifaransa': sobaanuroYeKifaransa,
      'sobaanuroYeKingereza': sobaanuroYeKingereza,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
