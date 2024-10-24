// lib/services/dictionary_service.dart
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/models/igambo.dart'; // Update this import

class DictionaryService {
  static const baseUrl = 'https://ibufuliiru.editorx.io/ibufuliiru/_functions';

  Future<DictionaryResponse> fetchDictionary(DictionaryType type) async {
    final endpoint = _getEndpoint(type);
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (kIsWeb) 'Access-Control-Allow-Origin': '*',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> items = decodedData['items'] ?? [];

        return DictionaryResponse(
          success: true,
          items: items.map((item) => Igambo.fromJson(item)).toList(),
        );
      } else {
        return DictionaryResponse(
          success: false,
          error: 'Failed to load dictionary: ${response.statusCode}',
        );
      }
    } catch (e) {
      return DictionaryResponse(
        success: false,
        error: 'Error: $e',
      );
    }
  }

  String _getEndpoint(DictionaryType type) {
    switch (type) {
      case DictionaryType.kifuliiru:
        return 'magamboGeKifuliiruMuKifuliiru';
      case DictionaryType.kiswahili:
        return 'magamboGeKifuliiruMuKiswahili';
      case DictionaryType.french:
        return 'magamboGeKifuliiruMuKifaransa';
      case DictionaryType.english:
        return 'magamboGeKifuliiruMuKingereza';
    }
  }
}

class DictionaryResponse {
  final List<Igambo>? items;
  final bool success;
  final String? error;

  DictionaryResponse({
    this.items,
    required this.success,
    this.error,
  });
}
