import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toohak/_toohak.dart';

part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question extends Equatable {
  const Question({
    required this.id,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.correctAnswer,
    required this.hint,
    required this.durationInSec,
    required this.doubleBoost,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return _$QuestionFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionToJson(this);
  }

  @JsonKey(name: QuestionFields.id)
  final String id;

  @JsonKey(name: QuestionFields.question)
  final String question;

  @JsonKey(name: QuestionFields.answer1)
  final String answer1;

  @JsonKey(name: QuestionFields.answer2)
  final String answer2;

  @JsonKey(name: QuestionFields.correctAnswer)
  final int correctAnswer;

  @JsonKey(name: QuestionFields.hint)
  final String? hint;

  @JsonKey(name: QuestionFields.durationInSec)
  final int durationInSec;

  @JsonKey(name: QuestionFields.doubleBoost)
  final bool doubleBoost;

  @override
  List<Object?> get props => <Object?>[
        id,
        question,
        answer1,
        answer2,
        correctAnswer,
        hint,
        durationInSec,
        doubleBoost,
      ];
}
