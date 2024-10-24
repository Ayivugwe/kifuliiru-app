import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kifuliiru_app/models/dictionary_type.dart';

import '../igambo.dart';

class DictionaryService {
  static const baseUrl = 'https://ibufuliiru.editorx.io/ibufuliiru/_functions';
  static const int defaultPageSize = 20;

  Future<PaginatedDictionaryResponse> fetchDictionary(
    DictionaryType type, {
    int page = 1,
    int pageSize = defaultPageSize,
    String? searchQuery,
    String? startsWith,
  }) async {
    final endpoint = _getEndpoint(type);
    final queryParams = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
      if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
      if (startsWith != null && startsWith.isNotEmpty) 'startsWith': startsWith,
    };

    try {
      final uri =
          Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);
        return PaginatedDictionaryResponse.fromJson(decodedResponse);
      } else {
        throw Exception(
            'Failed to load dictionary data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching dictionary data: $e');
    }
  }

  // Fetch only the total count of dictionary entries
  Future<int> fetchTotalEntries(DictionaryType type) async {
    final endpoint = _getEndpoint(type);
    final queryParams = {
      'countOnly': 'true',
    };

    try {
      final uri =
          Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);
        return decodedResponse['totalItems'] ?? 0;
      } else {
        throw Exception(
            'Failed to fetch total entries: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching total entries: $e');
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

class PaginatedDictionaryResponse {
  final List<Igambo> items;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  PaginatedDictionaryResponse({
    required this.items,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginatedDictionaryResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedDictionaryResponse(
      items: (json['items'] as List?)
              ?.map((item) => Igambo.fromJson(item))
              .toList() ??
          [],
      currentPage: json['currentPage'] ?? 1,
      totalPages: json['totalPages'] ?? 1,
      totalItems: json['totalItems'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }

  // Clear items when they're no longer needed
  void dispose() {
    items.clear();
  }
}
