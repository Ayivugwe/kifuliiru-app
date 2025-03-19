import 'dart:convert';
import 'package:flutter/services.dart';

class TranslationHelper {
  static final TranslationHelper _instance = TranslationHelper._internal();
  factory TranslationHelper() => _instance;
  TranslationHelper._internal();

  Map<String, dynamic> _translations = {};
  String _currentLocale = 'en';

  // Supported locales
  static const supportedLocales = [
    'en', // English
    'fr', // French
    'sw', // Swahili
    'fll', // Fuliiru
  ];

  // Get current locale
  String get currentLocale => _currentLocale;

  // Initialize translations
  Future<void> initialize() async {
    await loadTranslations(_currentLocale);
  }

  // Load translations for a specific locale
  Future<void> loadTranslations(String locale) async {
    try {
      final String jsonString = await rootBundle.loadString('lib/translations/$locale.json');
      _translations = json.decode(jsonString);
      _currentLocale = locale;
    } catch (e) {
      print('Error loading translations for $locale: $e');
      // Fallback to English if translation file not found
      if (locale != 'en') {
        await loadTranslations('en');
      }
    }
  }

  // Get translation by key
  String translate(String key) {
    try {
      final List<String> keys = key.split('.');
      dynamic value = _translations;
      
      for (String k in keys) {
        value = value[k];
        if (value == null) return key;
      }
      
      return value.toString();
    } catch (e) {
      print('Translation error for key $key: $e');
      return key;
    }
  }

  // Check if a translation exists
  bool hasTranslation(String key) {
    try {
      final List<String> keys = key.split('.');
      dynamic value = _translations;
      
      for (String k in keys) {
        value = value[k];
        if (value == null) return false;
      }
      
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get translation completion percentage for a locale
  Future<double> getTranslationCompletion(String locale) async {
    try {
      final String jsonString = await rootBundle.loadString('lib/translations/$locale.json');
      final Map<String, dynamic> translations = json.decode(jsonString);
      
      // Compare with English translations (assuming English is complete)
      final String enString = await rootBundle.loadString('lib/translations/en.json');
      final Map<String, dynamic> enTranslations = json.decode(enString);
      
      int totalKeys = countKeys(enTranslations);
      int translatedKeys = countKeys(translations);
      
      return totalKeys > 0 ? (translatedKeys / totalKeys) * 100 : 0;
    } catch (e) {
      print('Error calculating translation completion: $e');
      return 0;
    }
  }

  // Helper method to count keys in a nested map
  int countKeys(Map<String, dynamic> map) {
    int count = 0;
    map.forEach((key, value) {
      count++;
      if (value is Map) {
        count += countKeys(Map<String, dynamic>.from(value));
      }
    });
    return count;
  }
} 