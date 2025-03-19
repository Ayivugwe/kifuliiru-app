// lib/services/dictionary_service.dart
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/models/igambo.dart'; // Update this import
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/word.dart';

class DictionaryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get word by ID
  Future<Word?> getWord(String id) async {
    try {
      final doc = await _firestore.collection('words').doc(id).get();
      if (doc.exists) {
        return Word.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error getting word: $e');
      return null;
    }
  }

  // Search words
  Future<List<Word>> searchWords(String query) async {
    try {
      final snapshot = await _firestore
          .collection('words')
          .where('kifuliiru', isGreaterThanOrEqualTo: query)
          .where('kifuliiru', isLessThanOrEqualTo: query + '\uf8ff')
          .limit(20)
          .get();

      return snapshot.docs.map((doc) => Word.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error searching words: $e');
      return [];
    }
  }

  // Get words by category
  Future<List<Word>> getWordsByCategory(String category) async {
    try {
      final snapshot = await _firestore
          .collection('words')
          .where('category', isEqualTo: category)
          .limit(50)
          .get();

      return snapshot.docs.map((doc) => Word.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting words by category: $e');
      return [];
    }
  }

  // Get categories
  Future<List<String>> getCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      return snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error getting categories: $e');
      return [];
    }
  }

  // Get recent searches
  Future<List<String>> getRecentSearches(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final data = doc.data();
        return List<String>.from(data?['recentSearches'] ?? []);
      }
      return [];
    } catch (e) {
      print('Error getting recent searches: $e');
      return [];
    }
  }

  // Add recent search
  Future<void> addRecentSearch(String userId, String search) async {
    try {
      final userRef = _firestore.collection('users').doc(userId);
      await _firestore.runTransaction((transaction) async {
        final doc = await transaction.get(userRef);
        if (doc.exists) {
          final data = doc.data()!;
          final recentSearches = List<String>.from(data['recentSearches'] ?? []);
          if (!recentSearches.contains(search)) {
            recentSearches.insert(0, search);
            if (recentSearches.length > 10) {
              recentSearches.removeLast();
            }
            transaction.update(userRef, {'recentSearches': recentSearches});
          }
        }
      });
    } catch (e) {
      print('Error adding recent search: $e');
    }
  }

  // Get popular words
  Future<List<Word>> getPopularWords() async {
    try {
      final snapshot = await _firestore
          .collection('words')
          .orderBy('searchCount', descending: true)
          .limit(20)
          .get();

      return snapshot.docs.map((doc) => Word.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error getting popular words: $e');
      return [];
    }
  }

  // Increment search count
  Future<void> incrementSearchCount(String wordId) async {
    try {
      await _firestore.collection('words').doc(wordId).update({
        'searchCount': FieldValue.increment(1),
      });
    } catch (e) {
      print('Error incrementing search count: $e');
    }
  }

  Future<DictionaryResponse> fetchDictionary(DictionaryType type) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('dictionary')
          .where('type', isEqualTo: type.toString())
          .get();

      final List<Igambo> words = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Igambo.fromFirestore(doc.id, data);
      }).toList();

      return DictionaryResponse(
        success: true,
        items: words,
      );
    } catch (e) {
      return DictionaryResponse(
        success: false,
        error: 'Error fetching dictionary: $e',
      );
    }
  }
}

class DictionaryResponse {
  final bool success;
  final List<Igambo>? items;
  final String? error;

  DictionaryResponse({
    required this.success,
    this.items,
    this.error,
  });
}
