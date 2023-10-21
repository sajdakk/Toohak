import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'admin_state.dart';

class AdminCubit extends ThCubit<AdminState> {
  AdminCubit() : super(const AdminLoadingState());

  final Logger _logger = Logger('AdminCubit');
  final GameTemplateDataManager _gameTemplateDataManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init() async {
    _logger.info('Initializing AdminCubit');
    _gameTemplateDataManager.fetchData(NoFetchingParams());

    _subscription = _gameTemplateDataManager.data$.listen(
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
}
