// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTemplate _$GameTemplateFromJson(Map<String, dynamic> json) => GameTemplate(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecode(_$GameTypeEnumMap, json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GameTemplateToJson(GameTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'type': _$GameTypeEnumMap[instance.type]!,
    };

const _$GameTypeEnumMap = {
  GameType.normal: 'normal',
  GameType.hardcore: 'hardcore',
};
