import 'dart:convert';

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

    final dynamic typeRaw = data['type'];
    if (typeRaw is! String) {
      return;
    }

    final CloudEventType? type = CloudEventTypeMapper.fromName(typeRaw);
    if (type == null) {
      return;
    }

    switch (type) {
      case CloudEventType.playerJoined:
        _cloudEvents$.add(
          PlayerJoinedCloudEvent(
            username: data['username'],
          ),
        );
        break;

      case CloudEventType.questionSent:
        _cloudEvents$.add(
          QuestionSentCloudEvent(
            question: data['question'],
            answers: (jsonDecode(data['answers']) as List<dynamic>).cast(),
            hint: data['hint'],
            isDouble: data['is_double'] == 'true',
            finishWhen: DateTime.parse(data['finish_when']),
          ),
        );
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

  Future<String?> getToken() async {
    try {
      final bool isSupported = await FirebaseMessaging.instance.isSupported();
      if (!isSupported) {
        return null;
      }

      String? token = await FirebaseMessaging.instance.getToken(
        vapidKey: 'BDTg3K0NjFgNzNdT4ZJWq8Y4WVmfvNAejGNf5HLRqXvtet0mnLQQmC6pCRGOl2P575ZKQYa1V7OJcx-ewWLua0k',
      );
      return token;
    } catch (e) {
      return null;
    }
  }
}
