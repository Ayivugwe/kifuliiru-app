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
        // Decode the response body
        final dynamic decodedResponse = json.decode(response.body);

        // Handle both array and object responses
        List<dynamic> jsonData;
        if (decodedResponse is Map<String, dynamic>) {
          // If response is an object with items array
          jsonData = decodedResponse['items'] as List<dynamic>? ?? [];
        } else if (decodedResponse is List) {
          // If response is directly an array
          jsonData = decodedResponse;
        } else {
          throw Exception('Unexpected response format');
        }

        // Convert each item to Igambo object
        return jsonData.map((item) {
          if (item is Map<String, dynamic>) {
            return Igambo.fromJson(item);
          } else {
            throw Exception('Invalid item format in response');
          }
        }).toList();
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
        return 'magamboGeKifuliiruMuFrancais';
      case DictionaryType.english:
        return 'magamboGeKifuliiruMuEnglish';
    }
  }
}
