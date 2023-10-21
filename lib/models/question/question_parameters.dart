import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

class QuestionParameters extends Equatable {
  const QuestionParameters({
    required this.currentQuestion,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.correctAnswer,
    required this.hint,
    required this.durationInSec,
    required this.doubleBoost,
  });

  final Question? currentQuestion;

  final String question;

  final String answer1;

  final String answer2;

  final int correctAnswer;

  final String? hint;

  final int durationInSec;

  final bool doubleBoost;

  @override
  List<Object?> get props => <Object?>[
        currentQuestion,
        question,
        answer1,
        answer2,
        correctAnswer,
        hint,
        durationInSec,
        doubleBoost,
      ];
}
