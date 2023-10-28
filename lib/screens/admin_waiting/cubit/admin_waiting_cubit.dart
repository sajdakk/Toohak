import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toohak/_toohak.dart';

part 'admin_waiting_state.dart';

class AdminWaitingCubit extends ThCubit<AdminWaitingState> {
  AdminWaitingCubit() : super(const AdminWaitingLoadingState());

  final PlayersManager _playersManager = sl();
  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final GameTemplateDataManager _gameTemplateDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init({
    required String gameId,
    required String gameTemplateId,
  }) async {
    _gameTemplateDataManager.fetchWithId(gameTemplateId);

    _subscription = CombineLatestStream.combine2(
      _gameTemplateDataManager.dataForId$(gameTemplateId),
      _playersManager.players,
      (
        GameTemplate? gameTemplate,
        List<String> players,
      ) {
        if (gameTemplate == null) {
          emit(
            const AdminWaitingErrorState(
              error: 'Cannot find game',
            ),
          );

          return;
        }

        emit(
          AdminWaitingLoadedState(nicknames: players, gameTemplate: gameTemplate, gameId: gameId),
        );
      },
    ).listen((_) {});
  }

  Future<DateTime?> startGame({
    required String gameId,
    required Question question,
  }) async {
    BotToast.showLoading();
    final DateTime? success = await _cloudFunctionsManager.sendQuestion(
      gameId: gameId,
      question: question.question,
      hint: question.hint,
      isDouble: question.doubleBoost,
      timeInSeconds: question.durationInSec,
      answers: question.answers,
    );
    BotToast.closeAllLoading();
    return success;
  }
}
