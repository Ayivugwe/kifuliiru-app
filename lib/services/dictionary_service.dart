// lib/services/dictionary_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kifuliiru_app/models/dictionary_type.dart';
import 'package:kifuliiru_app/models/igambo.dart';

class DictionaryService {
  static const baseUrl = 'https://ibufuliiru.editorx.io/ibufuliiru/_functions';

  Future<List<Igambo>> fetchDictionary(DictionaryType type) async {
    final endpoint = _getEndpoint(type);
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Igambo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load dictionary data');
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
        return 'magamboGeKifuliiruMuFrancais';
      case DictionaryType.english:
        return 'magamboGeKifuliiruMuEnglish';
    }
  }
}
