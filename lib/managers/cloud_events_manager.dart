import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toohak/models/_models.dart';

class CloudEventsManager {
  final PublishSubject<CloudEvent> _cloudEvents$ = PublishSubject<CloudEvent>();

  Stream<CloudEvent> get cloudEvents {
    return _cloudEvents$;
  }

  Future<bool> init() async {
    FirebaseMessaging.onMessage.listen(_onMessage);
    return true;
  }

  // region Private

  Future<void> _onMessage(RemoteMessage message) async {
    final Map<String, dynamic> data = message.data;
    print('data : $data');

    final dynamic typeRaw = data['type'];
    if (typeRaw is! String) {
      print('typeRaw is not String');
      return;
    }

    final CloudEventType? type = CloudEventTypeMapper.fromName(typeRaw);
    if (type == null) {
      print('type is null');
      return;
    }
    print('type : $type');

    switch (type) {
      case CloudEventType.playerJoined:
        _cloudEvents$.add(
          PlayerJoinedCloudEvent(
            username: data['username'],
          ),
        );
        break;

      case CloudEventType.questionSent:
        // _cloudEvents$.add(typeRaw);
        break;
      case CloudEventType.rankingUpdated:
        // _cloudEvents$.add(typeRaw);
        break;
      case CloudEventType.roundFinished:
        // _cloudEvents$.add(typeRaw);
        break;
      case CloudEventType.gameFinished:
        // _cloudEvents$.add(typeRaw);
        break;
    }
  }

  // endregion
}
