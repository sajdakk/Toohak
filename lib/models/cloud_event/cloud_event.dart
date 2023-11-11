import 'package:equatable/equatable.dart';

sealed class CloudEvent extends Equatable {
  const CloudEvent();
}

class PlayerJoinedCloudEvent extends CloudEvent {
  const PlayerJoinedCloudEvent({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => <Object?>[
        username,
      ];
}

class QuestionSentCloudEvent extends CloudEvent {
  const QuestionSentCloudEvent({
    required this.question,
    required this.answers,
    required this.hint,
    required this.isDouble,
    required this.finishWhen,
  });

  final String question;
  final String? hint;
  final List<String> answers;
  final bool isDouble;
  final DateTime finishWhen;

  @override
  List<Object?> get props => <Object?>[
        question,
        answers,
        hint,
        isDouble,
        finishWhen,
      ];
}

class RoundFinishedCloudEvent extends CloudEvent {
  const RoundFinishedCloudEvent({
    required this.wasAnswerCorrect,
    required this.pointsForThisRound,
    required this.totalPoints,
    required this.currentPosition,
  });

  final bool wasAnswerCorrect;
  final int pointsForThisRound;
  final int totalPoints;
  final int currentPosition;

  @override
  List<Object?> get props => <Object?>[
        wasAnswerCorrect,
        pointsForThisRound,
        totalPoints,
        currentPosition,
      ];
}

class GameOverCloudEvent extends CloudEvent {
  const GameOverCloudEvent({
    required this.wasAnswerCorrect,
    required this.pointsForThisRound,
    required this.totalPoints,
    required this.currentPosition,
  });

  final bool wasAnswerCorrect;
  final int pointsForThisRound;
  final int totalPoints;
  final int currentPosition;

  @override
  List<Object?> get props => <Object?>[
        wasAnswerCorrect,
        pointsForThisRound,
        totalPoints,
        currentPosition,
      ];
}
