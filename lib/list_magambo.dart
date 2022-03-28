import 'dart:core';

import 'package:kifuliiru_app/igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MagamboList {
  late Future<List<Igambo>> futureIgambo;

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
  }
}
