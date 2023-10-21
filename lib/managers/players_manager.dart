import 'dart:async';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:toohak/_toohak.dart';

class PlayersManager {
  PlayersManager({
    required CloudEventsManager cloudEventsManager,
  }) : _cloudEventsManager = cloudEventsManager;

  final BehaviorSubject<List<String>> _players$ = BehaviorSubject<List<String>>.seeded(<String>[]);
  StreamSubscription? subscription;
  final CloudEventsManager _cloudEventsManager;

  ValueStream<List<String>> get players {
    return _players$;
  }

  Future<bool> init() async {
    subscription = _cloudEventsManager.cloudEvents.listen(_onEvent);
    return true;
  }

  Future<void> _onEvent(CloudEvent event) async {
    print(event);
    if (event is! PlayerJoinedCloudEvent) {
      print('event is not PlayerJoinedCloudEvent');
      return;
    }

    List<String> players = _players$.value.toList();
    players.add(event.username);
    print(players);
    print(event.username);

    _players$.add(players);
  }
}
