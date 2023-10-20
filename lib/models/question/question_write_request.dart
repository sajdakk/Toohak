import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toohak/_toohak.dart';

part 'question_write_request.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionWriteRequest extends Equatable {
  const QuestionWriteRequest({
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.correctAnswer,
    required this.hint,
    required this.durationInSec,
  });

  factory QuestionWriteRequest.fromJson(Map<String, dynamic> json) {
    return _$QuestionWriteRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionWriteRequestToJson(this);
  }

  @JsonKey(name: QuestionFields.question)
  final String question;

  @JsonKey(name: QuestionFields.answer1)
  final String answer1;

  @JsonKey(name: QuestionFields.answer2)
  final String answer2;

  @JsonKey(name: QuestionFields.correctAnswer)
  final int correctAnswer;

  @JsonKey(name: QuestionFields.hint)
  final String hint;

  @JsonKey(name: QuestionFields.durationInSec)
  final int durationInSec;

  @override
  List<Object?> get props => <Object?>[
        question,
        answer1,
        answer2,
        correctAnswer,
        hint,
        durationInSec,
      ];
}
