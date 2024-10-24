// lib/services/dictionary_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kifuliiru_app/models/dictionary_type.dart';

import '../igambo.dart';

class DictionaryService {
  static const baseUrl = 'https://ibufuliiru.editorx.io/ibufuliiru/_functions';

  Future<List<Igambo>> fetchDictionary(DictionaryType type) async {
    final endpoint = _getEndpoint(type);

    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);
        final dictionaryResponse = DictionaryResponse.fromJson(decodedResponse);

        if (dictionaryResponse.items == null) {
          return [];
        }

        return dictionaryResponse.items!;
      } else {
        throw Exception(
            'Failed to load dictionary data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching dictionary data: $e');
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
