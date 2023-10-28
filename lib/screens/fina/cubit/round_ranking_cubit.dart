import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'round_ranking_state.dart';

class RoundRankingCubit extends ThCubit<RoundRankingState> {
  RoundRankingCubit() : super(RoundRankingLoadingState());

  final GameManager _gameManager = sl();

  Future<void> init() async {
    emit(
      RoundRankingLoadedState(
        players: _gameManager.rankingPlayers,
      ),
    );
  }
}
