part of 'final_ranking_cubit.dart';

abstract class FinalRankingState extends Equatable {
  const FinalRankingState();
  @override
  List<Object?> get props => <dynamic>[];
}

class FinalRankingLoadingState extends FinalRankingState {}

class FinalRankingLoadedState extends FinalRankingState {
  const FinalRankingLoadedState({
    required this.players,
    required this.somebodyStillPlaying,
  });

  final List<RankingPlayer> players;
  final bool somebodyStillPlaying;


  @override
  List<Object?> get props => <dynamic>[
        players,
        somebodyStillPlaying,
      ];
}

class FinalRankingErrorState extends FinalRankingState {
  const FinalRankingErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <dynamic>[
        message,
      ];
}
