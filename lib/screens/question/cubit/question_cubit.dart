import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/round_ranking/round_ranking_screen.dart';

part 'question_state.dart';

class QuestionCubit extends ThCubit<QuestionState> {
  QuestionCubit() : super(const QuestionLoadingState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();
  final GameTemplateDataManager _gameTemplateDataManager = sl();

  StreamSubscription<dynamic>? _subscription;
  GameTemplate? _gameTemplate;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> init({
    required String gameTemplateId,
    required DateTime? finishWhen,
    required String gameId,
  }) async {
    await _gameTemplateDataManager.fetchWithId(gameTemplateId);
    GameTemplate? gameTemplate = _gameTemplateDataManager.dataWithId(gameTemplateId);

    if (gameTemplate == null) {
      emit(
        const QuestionErrorState(
          message: 'Cannot find template',
        ),
      );

      return;
    }
    _gameTemplate = gameTemplate;

    emit(
      QuestionLoadedState(
        gameTemplate: gameTemplate,
      ),
    );

    if (finishWhen != null && _gameTemplate != null) {
      Duration duration = finishWhen.difference(DateTime.now());

      Future.delayed(duration, () {
        finishRound(
          correctAnswerIndex: _gameTemplate!.questions[0].correctAnswerIndex,
          gameId: gameId,
          doubleBoost: _gameTemplate!.questions[0].doubleBoost,
        );
      });
    }
  }

  Future<void> finishRound({
    required String gameId,
    required int correctAnswerIndex,
    required bool doubleBoost,
  }) async {
    emit(const QuestionLoadingState());

    String? token = await _cloudEventsManager.getToken();

    if (token == null) {
      return;
    }

    int maxPoints = 1000;
    if (doubleBoost) {
      maxPoints *= 2;
    }

    List<RankingPlayer> result = await _cloudFunctionsManager.finishRound(
      gameId: gameId,
      currentRanking: <RankingPlayer>[],
      correctAnswerIndex: correctAnswerIndex,
      maxPoints: maxPoints,
    );

    thRouter.pushNamed(
      RoundRankingScreen.getRoute(gameId),
      arguments: result,
    );
  }
}
