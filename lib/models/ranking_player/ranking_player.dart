import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_player.g.dart';

@JsonSerializable()
class RankingPlayer extends Equatable {
  const RankingPlayer({
    required this.token,
    required this.username,
    required this.points,
  });

  // region Json

  factory RankingPlayer.fromJson(Map<String, dynamic> json) {
    return _$RankingPlayerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RankingPlayerToJson(this);
  }

  // endregion

  final String token;
  final String username;
  final int points;

  @override
  List<Object?> get props => <Object?>[
        token,
        username,
        points,
      ];
}
