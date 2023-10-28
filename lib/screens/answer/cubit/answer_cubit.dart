import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/result/result_screen.dart';

part 'answer_state.dart';

class AnswerCubit extends ThCubit<AnswerState> {
  AnswerCubit() : super(AnswerLoadedState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();

  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init(String gameId) async {
    _subscription = _cloudEventsManager.cloudEvents.listen(
      (CloudEvent event) {
        if (event is RoundFinishedCloudEvent) {
          thRouter.pushNamed(
            ResultScreen.getRoute(gameId),
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
    String? token = await _cloudEventsManager.getToken();

    if (token == null) {
      return false;
    }

    bool result = await _cloudFunctionsManager.sendAnswer(
      gameId: gameId,
      token: token,
      answerIndex: answerIndex,
      wasHintUsed: wasHintUsed,
    );

    BotToast.closeAllLoading();

    return result;
  }
}
