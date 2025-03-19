class UserProgress {
  final String userId;
  final Map<String, LessonProgress> lessonProgress;
  final Map<String, QuizProgress> quizProgress;
  final Map<String, PracticeProgress> practiceProgress;
  final int totalPoints;
  final int level;

  const UserProgress({
    required this.userId,
    required this.lessonProgress,
    required this.quizProgress,
    required this.practiceProgress,
    required this.totalPoints,
    required this.level,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      userId: json['userId'],
      lessonProgress: (json['lessonProgress'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, LessonProgress.fromJson(value)),
      ),
      quizProgress: (json['quizProgress'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, QuizProgress.fromJson(value)),
      ),
      practiceProgress: (json['practiceProgress'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, PracticeProgress.fromJson(value)),
      ),
      totalPoints: json['totalPoints'],
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'lessonProgress': lessonProgress.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'quizProgress': quizProgress.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'practiceProgress': practiceProgress.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'totalPoints': totalPoints,
      'level': level,
    };
  }
}

class LessonProgress {
  final bool isCompleted;
  final DateTime? lastAccessed;
  final int score;
  final List<String> completedSteps;

  const LessonProgress({
    required this.isCompleted,
    this.lastAccessed,
    required this.score,
    required this.completedSteps,
  });

  factory LessonProgress.fromJson(Map<String, dynamic> json) {
    return LessonProgress(
      isCompleted: json['isCompleted'],
      lastAccessed: json['lastAccessed'] != null 
          ? DateTime.parse(json['lastAccessed'])
          : null,
      score: json['score'],
      completedSteps: List<String>.from(json['completedSteps']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCompleted': isCompleted,
      'lastAccessed': lastAccessed?.toIso8601String(),
      'score': score,
      'completedSteps': completedSteps,
    };
  }
}

class QuizProgress {
  final bool isCompleted;
  final DateTime? lastAttempted;
  final int score;
  final int attempts;

  const QuizProgress({
    required this.isCompleted,
    this.lastAttempted,
    required this.score,
    required this.attempts,
  });

  factory QuizProgress.fromJson(Map<String, dynamic> json) {
    return QuizProgress(
      isCompleted: json['isCompleted'],
      lastAttempted: json['lastAttempted'] != null 
          ? DateTime.parse(json['lastAttempted'])
          : null,
      score: json['score'],
      attempts: json['attempts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCompleted': isCompleted,
      'lastAttempted': lastAttempted?.toIso8601String(),
      'score': score,
      'attempts': attempts,
    };
  }
}

class PracticeProgress {
  final int totalAttempts;
  final int correctAttempts;
  final DateTime? lastPracticed;
  final Map<String, int> categoryProgress;

  const PracticeProgress({
    required this.totalAttempts,
    required this.correctAttempts,
    this.lastPracticed,
    required this.categoryProgress,
  });

  factory PracticeProgress.fromJson(Map<String, dynamic> json) {
    return PracticeProgress(
      totalAttempts: json['totalAttempts'],
      correctAttempts: json['correctAttempts'],
      lastPracticed: json['lastPracticed'] != null 
          ? DateTime.parse(json['lastPracticed'])
          : null,
      categoryProgress: Map<String, int>.from(json['categoryProgress']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalAttempts': totalAttempts,
      'correctAttempts': correctAttempts,
      'lastPracticed': lastPracticed?.toIso8601String(),
      'categoryProgress': categoryProgress,
    };
  }
} 