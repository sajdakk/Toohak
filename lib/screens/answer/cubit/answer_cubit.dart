import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/game_over/game_over_screen.dart';
import 'package:toohak/screens/result/result_screen.dart';

part 'answer_state.dart';

class AnswerCubit extends ThCubit<AnswerState> {
  AnswerCubit() : super(AnswerLoadedState());

  final FunctionsManager _functionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();

  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init() async {
    _subscription = _cloudEventsManager.cloudEvents.listen(
      (CloudEvent event) {
        if (event is RoundFinishedCloudEvent) {
          thRouter.replace(
            ResultScreen.route,
            arguments: event,
          );
        }

        if (event is GameOverCloudEvent) {
          thRouter.replace(
            GameOverScreen.route,
            arguments: event,
          );
        }
      },
    );
  }

  Future<bool> sendAnswer({
    required String gameId,
    required int answerIndex,
    required bool wasHintUsed,
  }) async {
    BotToast.showLoading();
    String? token = _cloudEventsManager.getToken();
    if (token == null) {
      return false;
    }

    bool result = await _functionsManager.sendAnswer(
      gameId: gameId,
      token: token,
      answerIndex: answerIndex,
      wasHintUsed: wasHintUsed,
    );

    BotToast.closeAllLoading();

    return result;
  }
}
