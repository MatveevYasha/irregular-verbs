import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:irregular_verbs_app/data/dtos/verb_dto.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';

typedef Json = Map<String, Object?>;

class FetchDataProvider {
  Future<List<Verb>> fetchFileFromAssets(BuildContext context) async {
    final fileData = await DefaultAssetBundle.of(context).loadString('assets/json/verbs.json');
    final json = jsonDecode(fileData);

    final listJson = List.castFrom<dynamic, Json>(json);

    return listJson.map((e) => VerbDTO.fromJson(e).toEntity()).toList();
  }
}
