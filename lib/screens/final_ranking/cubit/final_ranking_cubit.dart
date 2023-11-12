import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'final_ranking_state.dart';

class FinalRankingCubit extends ThCubit<FinalRankingState> {
  FinalRankingCubit() : super(FinalRankingLoadingState());

  final GameManager _gameManager = sl();

  Future<void> init() async {
    List<RankingPlayer> rankingPlayers = _gameManager.rankingPlayers.toList();
    rankingPlayers.sort((RankingPlayer a, RankingPlayer b) {
      return b.points.compareTo(a.points);
    });

    List<EndGameResult> endGameResults = _gameManager.endGameResult.toList();
    endGameResults.sort((EndGameResult a, EndGameResult b) {
      return b.points.compareTo(a.points);
    });

    emit(
      FinalRankingLoadedState(
        players: rankingPlayers,
        endGameResults: endGameResults,
      ),
    );
  }
}
