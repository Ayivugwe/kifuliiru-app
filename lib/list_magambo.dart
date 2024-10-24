import 'dart:core';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/igambo.dart';

class MagamboList {
  late Future<List<Igambo>> futureIgambo;

  List<Igambo> parseIgambo(String responseBody) {
    final parsed =
        json.decode(responseBody)['items'].cast<Map<String, dynamic>>();

    return parsed.map<Igambo>((json) => Igambo.fromJson(json)).toList();
  }

  //get data from local json file
  //final response = await http.get(Uri.parse('assets/database/magambo.json'));

  //Fetch data from an API (link or endpoint)
  Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'));
    if (response.statusCode == 200) {
      List<Igambo> igamboList = parseIgambo(response.body);
      igamboList.sort((a, b) =>
          a.title.compareTo(b.title)); // Sort the list in ascending order
      return igamboList; // Return the sorted list
    } else {
      throw Exception('Twayabirwa ukuleta amagambo.');
    }
  }

  List<Map<String, dynamic>> convertToMap({required List myList}) {
    List<Map<String, dynamic>> list = [];

    return list;
  }
}
