import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'answer_state.dart';

class AnswerCubit extends ThCubit<AnswerState> {
  AnswerCubit() : super(AnswerLoadedState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();

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
