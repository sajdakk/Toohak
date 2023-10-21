import 'dart:async';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:toohak/_toohak.dart';

part 'admin_state.dart';

class AdminCubit extends ThCubit<AdminState> {
  AdminCubit() : super(const AdminLoadingState());

  final Logger _logger = Logger('AdminCubit');
  final GameTemplateDataManager _gameTemplateDataManager = sl();
  final GameDataManager _gameDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init() async {
    _logger.info('Initializing AdminCubit');
    String? userId = appSession.currentUser?.uid;
    if (userId == null) {
      emit(
        const AdminErrorState(
          error: 'Cannot find user',
        ),
      );

      return;
    }

    await _gameTemplateDataManager.fetchWithUserId(userId);

    _subscription = _gameTemplateDataManager.dataWithUserId$(userId).listen(
      (List<GameTemplate> templates) {
        emit(
          AdminLoadedState(
            templates: templates,
          ),
        );
      },
    );
  }

  Future<bool> deleteTemplate(String id) async {
    BotToast.showLoading();
    final bool success = await _gameTemplateDataManager.deleteGameTemplate(id: id);
    BotToast.closeAllLoading();
    return success;
  }

  Future<bool> createGame(String id) async {
    try {
      final bool isSupported = await FirebaseMessaging.instance.isSupported();
      if (!isSupported) {
        print('FirebaseMessaging is not supported on this platform');
        return false;
      }

      BotToast.showLoading();
      String code = Random().nextInt(999999).toString().padLeft(6, '0');
      String? token = await FirebaseMessaging.instance.getToken(
        vapidKey: 'BDTg3K0NjFgNzNdT4ZJWq8Y4WVmfvNAejGNf5HLRqXvtet0mnLQQmC6pCRGOl2P575ZKQYa1V7OJcx-ewWLua0k',
      );
      if (token == null) {
        BotToast.closeAllLoading();
        print('Error while getting token');
        return false;
      }

      final String? success = await _gameDataManager.addGame(
        gameWriteRequest: GameWriteRequest(
          gameTemplateId: id,
          code: code,
          signUpBlocked: false,
          adminToken: token,
        ),
      );
      BotToast.closeAllLoading();
      if (success == null) {
        return false;
      }

      return true;
    } catch (e) {
      print('Error while creating game: $e');
      return false;
    }
  }
}
