// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionWriteRequest _$QuestionWriteRequestFromJson(
        Map<String, dynamic> json) =>
    QuestionWriteRequest(
      question: json['question'] as String,
      answer1: json['answer_1'] as String,
      answer2: json['answer_2'] as String,
      correctAnswer: json['correct_answer'] as int,
      hint: json['hint'] as String,
      durationInSec: json['duration_in_sec'] as int,
    );

Map<String, dynamic> _$QuestionWriteRequestToJson(
        QuestionWriteRequest instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer_1': instance.answer1,
      'answer_2': instance.answer2,
      'correct_answer': instance.correctAnswer,
      'hint': instance.hint,
      'duration_in_sec': instance.durationInSec,
    };
