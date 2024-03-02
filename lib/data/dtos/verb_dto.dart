import 'package:json_annotation/json_annotation.dart';

import 'package:irregular_verbs_app/data/entities/verb.dart';
import 'package:irregular_verbs_app/data/provider/fetch_data_provider.dart';

part 'verb_dto.g.dart';

@JsonSerializable(createToJson: false)
class VerbDTO {
  @JsonKey(name: 'baseForm')
  final String baseForm;

  @JsonKey(name: 'pastSimple')
  final String pastSimple;

  @JsonKey(name: 'pastParticiple')
  final String pastParticiple;

  @JsonKey(name: 'translation')
  final String translation;

  VerbDTO({
    required this.baseForm,
    required this.pastSimple,
    required this.pastParticiple,
    required this.translation,
  });

  factory VerbDTO.fromJson(Json json) => _$VerbDTOFromJson(json);

  Verb toEntity() => Verb(
        baseForm: baseForm,
        pastSimple: pastSimple,
        pastParticiple: pastParticiple,
        translation: translation,
      );
}
