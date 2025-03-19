import 'package:cloud_firestore/cloud_firestore.dart';

class Word {
  final String id;
  final String kifuliiru;
  final String english;
  final String french;
  final String kiswahili;
  final String category;
  final String description;
  final String example;
  final int searchCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Word({
    required this.id,
    required this.kifuliiru,
    required this.english,
    required this.french,
    required this.kiswahili,
    required this.category,
    required this.description,
    required this.example,
    required this.searchCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Word.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Word(
      id: doc.id,
      kifuliiru: data['kifuliiru'] ?? '',
      english: data['english'] ?? '',
      french: data['french'] ?? '',
      kiswahili: data['kiswahili'] ?? '',
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      example: data['example'] ?? '',
      searchCount: data['searchCount'] ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kifuliiru': kifuliiru,
      'english': english,
      'french': french,
      'kiswahili': kiswahili,
      'category': category,
      'description': description,
      'example': example,
      'searchCount': searchCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  Word copyWith({
    String? id,
    String? kifuliiru,
    String? english,
    String? french,
    String? kiswahili,
    String? category,
    String? description,
    String? example,
    int? searchCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Word(
      id: id ?? this.id,
      kifuliiru: kifuliiru ?? this.kifuliiru,
      english: english ?? this.english,
      french: french ?? this.french,
      kiswahili: kiswahili ?? this.kiswahili,
      category: category ?? this.category,
      description: description ?? this.description,
      example: example ?? this.example,
      searchCount: searchCount ?? this.searchCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
} 