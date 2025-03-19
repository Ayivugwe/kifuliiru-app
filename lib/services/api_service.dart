import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/lesson.dart';
import '../models/user_progress.dart';

class ApiService {
  static const String baseUrl = 'YOUR_API_BASE_URL'; // Replace with your actual API URL
  static const String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

  // Headers for API requests
  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  // Lessons API
  Future<List<Lesson>> getLessons() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/lessons'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Lesson.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load lessons');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // User Progress API
  Future<UserProgress> getUserProgress(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId/progress'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return UserProgress.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user progress');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update Lesson Progress
  Future<void> updateLessonProgress(String userId, String lessonId, LessonProgress progress) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/$userId/lessons/$lessonId/progress'),
        headers: _headers,
        body: json.encode(progress.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update lesson progress');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Practice Exercises API
  Future<Map<String, dynamic>> getPracticeExercises(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/practice/$category'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load practice exercises');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Submit Practice Results
  Future<void> submitPracticeResults(
    String userId,
    String category,
    int score,
    int totalQuestions,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/$userId/practice/$category/results'),
        headers: _headers,
        body: json.encode({
          'score': score,
          'totalQuestions': totalQuestions,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to submit practice results');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Quizzes API
  Future<Map<String, dynamic>> getQuiz(String quizId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/quizzes/$quizId'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load quiz');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Submit Quiz Results
  Future<void> submitQuizResults(
    String userId,
    String quizId,
    int score,
    List<String> answers,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users/$userId/quizzes/$quizId/results'),
        headers: _headers,
        body: json.encode({
          'score': score,
          'answers': answers,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to submit quiz results');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
} 