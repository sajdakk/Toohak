// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String,
      question: json['question'] as String,
      answer1: json['answer_1'] as String,
      answer2: json['answer_2'] as String,
      correctAnswer: json['correct_answer'] as int,
      hint: json['hint'] as String,
      durationInSec: json['duration_in_sec'] as int,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer_1': instance.answer1,
      'answer_2': instance.answer2,
      'correct_answer': instance.correctAnswer,
      'hint': instance.hint,
      'duration_in_sec': instance.durationInSec,
    };
