// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_game_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndGameResult _$EndGameResultFromJson(Map<String, dynamic> json) =>
    EndGameResult(
      playerUsername: json['player_username'] as String,
      points: json['points'] as int,
      questionsAnswered: json['questions_answered'] as int,
      questionsAnsweredCorrectly: json['questions_answered_correctly'] as int,
      averageAnswerTimeInMilis: json['average_answer_time'] as int,
    );

Map<String, dynamic> _$EndGameResultToJson(EndGameResult instance) =>
    <String, dynamic>{
      'player_username': instance.playerUsername,
      'points': instance.points,
      'questions_answered': instance.questionsAnswered,
      'questions_answered_correctly': instance.questionsAnsweredCorrectly,
      'average_answer_time': instance.averageAnswerTimeInMilis,
    };
