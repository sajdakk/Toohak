import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toohak/_toohak.dart';

part 'end_game_result.g.dart';

@JsonSerializable()
class EndGameResult extends Equatable {
  const EndGameResult({
    required this.playerUsername,
    required this.points,
    required this.questionsAnswered,
    required this.questionsAnsweredCorrectly,
    required this.averageAnswerTimeInMilis,
  });

  factory EndGameResult.fromJson(Map<String, dynamic> json) => _$EndGameResultFromJson(json);

  @JsonKey(name: EndGameResultFields.playerUsername)
  final String playerUsername;

  @JsonKey(name: EndGameResultFields.points)
  final int points;

  @JsonKey(name: EndGameResultFields.questionsAnswered)
  final int questionsAnswered;

  @JsonKey(name: EndGameResultFields.questionsAnsweredCorrectly)
  final int questionsAnsweredCorrectly;

  @JsonKey(name: EndGameResultFields.averageAnswerTimeInMilis)
  final int averageAnswerTimeInMilis;

  @override
  List<Object?> get props => <Object?>[
        playerUsername,
        points,
        questionsAnswered,
        questionsAnsweredCorrectly,
        averageAnswerTimeInMilis,
      ];
}
