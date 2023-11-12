part of 'round_ranking_cubit.dart';

abstract class RoundRankingState extends Equatable {
  const RoundRankingState();
  @override
  List<Object?> get props => <dynamic>[];
}

class RoundRankingLoadingState extends RoundRankingState {}

class RoundRankingLoadedState extends RoundRankingState {
  const RoundRankingLoadedState({
    required this.players,
    required this.endGameResults,
  });

  final List<RankingPlayer> players;
  final List<EndGameResult> endGameResults;

  @override
  List<Object?> get props => <dynamic>[
        players,
        endGameResults,
      ];
}

class RoundRankingErrorState extends RoundRankingState {
  const RoundRankingErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <dynamic>[
        message,
      ];
}
