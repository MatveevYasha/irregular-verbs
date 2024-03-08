import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:irregular_verbs_app/data/dtos/verb_json_dto.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';

typedef Json = Map<String, Object?>;

class FetchDataProvider {
  Future<List<Verb>> fetchFileFromAssets() async {
    final fileData = await rootBundle.loadString('assets/json/verbs.json');
    final json = jsonDecode(fileData);

    final listJson = List.castFrom<dynamic, Json>(json);

    return listJson.map((e) => VerbDTO.fromJson(e).toEntity()).toList();
  }
}
