import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toohak/_toohak.dart';

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
        _cloudEvents$.add(
          RoundFinishedCloudEvent(
            wasAnswerCorrect: _getWasAnswerCorrect(data['was_answer_correct']),
            pointsForThisRound: int.parse(data['points_for_this_round']),
            totalPoints: int.parse(data['total_points']),
            currentPosition: int.parse(data['current_position']),
            answeredNth: int.tryParse(data['answered_nth'] ?? ''),
          ),
        );
        break;
      case CloudEventType.gameOver:
        _cloudEvents$.add(
          GameOverCloudEvent(
            didPlayerLost: data['did_player_lost'] == 'true',
            finalPosition: int.parse(data['final_position']),
            totalPoints: int.parse(data['total_points']),
            questionsAnswered: int.parse(data['questions_answered']),
            questionsAnsweredCorrectly: int.parse(data['questions_answered_correctly']),
            averageAnswerTimeInMilis: int.parse(data['average_answer_time']),
          ),
        );
        break;
    }
  }

  bool? _getWasAnswerCorrect(String value) {
    if (value == "null") {
      return null;
    }

    if (value == "true") {
      return true;
    }

    return false;
  }

  // endregion

  Future<String?> getToken() async {
    try {
      final NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        ThMessage.showError('User has declined notifications');
        return null;
      }

      final bool isSupported = await FirebaseMessaging.instance.isSupported();
      if (!isSupported) {
        ThMessage.showError('Firebase messaging is not supported on this device');

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
