import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'nickname_state.dart';

class NicknameCubit extends ThCubit<NicknameState> {
  NicknameCubit() : super(NicknameLoadedState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();
  final CloudEventsManager _cloudEventsManager = sl();

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

    BotToast.closeAllLoading();

    return success;
  }
}
