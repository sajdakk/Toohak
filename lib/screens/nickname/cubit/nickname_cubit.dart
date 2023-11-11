import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'nickname_state.dart';

class NicknameCubit extends ThCubit<NicknameState> {
  NicknameCubit() : super(NicknameLoadedState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();
  final GameTemplateDataManager _gameTemplateDataManager = sl();
  final GameDataManager _gameDataManager = sl();
  final GameManager _gameManager = sl();

  Future<String?> joinGame({
    required String code,
    required String username,
  }) async {
    BotToast.showLoading();
    String? token = await _cloudEventsManager.getToken();

    if (token == null) {
      BotToast.closeAllLoading();
      return null;
    }

    final String? success = await _cloudFunctionsManager.joinGame(
      code: code,
      username: username,
      token: token,
    );

    if (success == null) {
      BotToast.closeAllLoading();
      return null;
    }

    await _gameDataManager.fetchWithId(success);
    Game? game = _gameDataManager.dataWithId(success);

    if (game == null) {
      BotToast.closeAllLoading();
      return null;
    }

    await _gameTemplateDataManager.fetchWithId(game.gameTemplateId);
    GameTemplate? gameTemplate = _gameTemplateDataManager.dataWithId(game.gameTemplateId);
    if (gameTemplate == null) {
      BotToast.closeAllLoading();
      return null;
    }

    _gameManager.setGame(
      game,
      gameTemplate,
    );

    BotToast.closeAllLoading();

    return success;
  }
}
