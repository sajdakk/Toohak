import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:toohak/_toohak.dart';

part 'nickname_state.dart';

class NicknameCubit extends ThCubit<NicknameState> {
  NicknameCubit() : super(NicknameLoadedState());

  final CloudFunctionsManager _cloudFunctionsManager = sl();

  Future<bool> tmp({
    required String code,
    required String username,
  }) async {
    BotToast.showLoading();
    String? token = await FirebaseMessaging.instance.getToken(
      vapidKey: 'BDTg3K0NjFgNzNdT4ZJWq8Y4WVmfvNAejGNf5HLRqXvtet0mnLQQmC6pCRGOl2P575ZKQYa1V7OJcx-ewWLua0k',
    );
    if (token == null) {
      BotToast.closeAllLoading();
      return false;
    }

    final bool success = await _cloudFunctionsManager.joinGame(
      code: code,
      username: username,
      token: token,
    );

    BotToast.closeAllLoading();

    if (success) {
      return true;
    }

    return false;
  }
}
