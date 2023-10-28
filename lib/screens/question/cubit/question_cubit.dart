import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/final_ranking/final_ranking_screen.dart';
import 'package:toohak/screens/round_ranking/round_ranking_screen.dart';

part 'question_state.dart';

class QuestionCubit extends ThCubit<QuestionState> {
  QuestionCubit() : super(const QuestionLoadingState());

  final CloudEventsManager _cloudEventsManager = sl();
  final GameManager _gameManager = sl();

  Future<void> init({
    required DateTime? finishWhen,
  }) async {
    Question? question = _gameManager.currentQuestion;

    if (question == null) {
      emit(
        const QuestionErrorState(
          message: 'Cannot find question',
        ),
      );

      return;
    }

    emit(
      QuestionLoadedState(
        question: question,
      ),
    );

    if (finishWhen != null) {
      Duration duration = finishWhen.difference(DateTime.now());

      Future.delayed(duration, () {
        finishRound();
      });
    }
  }

  Future<void> finishRound() async {
    emit(const QuestionLoadingState());

    String? token = await _cloudEventsManager.getToken();

    if (token == null) {
      return;
    }

    bool result = await _gameManager.finishRound();

    if (!result) {
      return;
    }

    Question? question = _gameManager.currentQuestion;
    print("game id:" + _gameManager.game!.id);
    if (question == null) {
      thRouter.pushNamed(
        FinalRankingScreen.getRoute(),
      );
      return;
    }

    thRouter.pushNamed(
      RoundRankingScreen.getRoute(),
    );
  }
}
