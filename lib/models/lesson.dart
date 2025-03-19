class Lesson {
  final String title;
  final String description;
  final String duration;
  final bool isLocked;

  const Lesson({
    required this.title,
    required this.description,
    required this.duration,
    required this.isLocked,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      isLocked: json['isLocked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'duration': duration,
      'isLocked': isLocked,
    };
  }
} 