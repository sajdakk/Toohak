import 'package:toohak/_toohak.dart';

abstract class CloudEventTypeMapper {
  CloudEventTypeMapper._();

  static CloudEventType? fromName(String cloudEventType) {
    switch (cloudEventType) {
      case 'PLAYER_JOINED':
        return CloudEventType.playerJoined;

      case 'QUESTION_SENT':
        return CloudEventType.questionSent;
      case 'RANKING_UPDATED':
        return CloudEventType.rankingUpdated;
      case 'ROUND_FINISHED':
        return CloudEventType.roundFinished;
      case 'GAME_FINISHED':
        return CloudEventType.gameFinished;

      default:
        return null;
    }
  }
}
