import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';

part 'admin_waiting_state.dart';

class AdminWaitingCubit extends ThCubit<AdminWaitingState> {
  AdminWaitingCubit() : super(AdminWaitingLoadedState.empty);

  final PlayersManager _playersManager = sl();

  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init() async {
    print('Initializing AdminWaitingCubit');
    _subscription = _playersManager.players.listen(
      (List<String> players) {
        print('Players: $players');
        emit(
          AdminWaitingLoadedState(
            nicknames: players,
          ),
        );

        return;
      },
    );
  }
}
