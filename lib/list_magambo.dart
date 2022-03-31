import 'dart:core';

import 'package:kifuliiru_app/igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MagamboList {
  late Future<List<Igambo>> futureIgambo;

  //pass json file to the list
  List<Igambo> parseIgambo(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Igambo>((json) => Igambo.fromJson(json)).toList();
  }

  //get data from local json file
  Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse('assets/database/magambo.json'));

    if (response.statusCode == 200) {
      return parseIgambo(response.body);
    } else {
      throw Exception('Failed to load igambo');
    }
  }
/* 
  Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'
        //'https://retoolapi.dev/bibawy/data'

        ));
    if (response.statusCode == 200) {
      List<Igambo> parsed = (json.decode(response.body)['items'] as List)
          .map((data) => Igambo.fromJson(data))
          .toList();

      return parsed;
    } else {
      throw Exception('Twayabirwa ukuleta amagambo.');
    }
  } */
}
