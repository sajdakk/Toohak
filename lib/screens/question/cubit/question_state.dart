part of 'question_cubit.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();
  @override
  List<Object?> get props => <dynamic>[];
}

class QuestionLoadedState extends QuestionState {
  const QuestionLoadedState({
    required this.question,
  });

  final Question question;

  @override
  List<Object?> get props => <Object?>[
        question,
      ];
}

class QuestionLoadingState extends QuestionState {
  const QuestionLoadingState();
}

class QuestionErrorState extends QuestionState {
  const QuestionErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}
