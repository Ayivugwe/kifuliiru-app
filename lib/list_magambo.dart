import 'dart:core';

import 'package:kifuliiru_app/igambo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      return parseIgambo(response.body);
    } else {
      throw Exception('Twayabirwa ukuleta amagambo.');
    }
  }

  List<Map<String, dynamic>> convertToMap({required List myList}) {
    List<Map<String, dynamic>> list = [];
    for (var element in myList) {
      Map gam = element.toMap();
      //list.add(gam);
    }
    return list;
  }

  /* 
   Future<List<Igambo>> fetchIgambo() async {
    final response = await http.get(Uri.parse(
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru'
        //'https://retoolapi.dev/bibawy/data'
        //
        ));
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['items'];
      return body.map<Igambo>(Igambo.fromJson).toList();

      /*  List<Igambo> parsed = json
          .decode(response.body)['items']
          .map((data) => Igambo.fromJson(data))
          .toList(); */

    } else {
      throw Exception('Twayabirwa ukuleta amagambo.');
    }
  } //fetchIgambo 
  */
  /* 
  Future<List<dynamic>> fetchIgambo() async {
    String url =
        'https://ibufuliiru.editorx.io/ibufuliiru/_functions/magamboGeKifuliiruMuKifuliiru';
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return json.decode(response.body)['items'];
  } */
}
