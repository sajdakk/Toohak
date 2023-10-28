import 'package:cloud_functions/cloud_functions.dart';
import 'package:toohak/_toohak.dart';

class CloudFunctionsDataProvider {
  final FirebaseFunctions _firebaseFunctions = sl();
  static const String _joinGame = 'join_game';
  static const String _sendQuestion = 'send_question';
  static const String _sendAnswer = 'send_answer';
  static const String _finishRound = 'finish_round';

  Future<String> joinGame({
    required String code,
    required String username,
    required String token,
  }) async {
    final HttpsCallable callable = _firebaseFunctions.httpsCallable(_joinGame);
    HttpsCallableResult result = await callable.call<dynamic>(<String, dynamic>{
      'code': code,
      'username': username,
      'token': token,
    });

    return result.data['game_id'];
  }

  Future<List<RankingPlayer>> finishRound({
    required String gameId,
    required int correctAnswerIndex,
    required int maxPoints,
    required List<RankingPlayer> currentRanking,
  }) async {
    final HttpsCallable callable = _firebaseFunctions.httpsCallable(_finishRound);
    HttpsCallableResult result = await callable.call<dynamic>(<String, dynamic>{
      'game_id': gameId,
      'correct_answer_index': correctAnswerIndex,
      'max_points': maxPoints,
      'current_ranking': currentRanking,
    });

    List<dynamic> rankingRaw = result.data['ranking'];
    List<RankingPlayer> ranking = rankingRaw.map((e) => RankingPlayer.fromJson(e)).toList();

    return ranking;
  }

  Future<DateTime> sendQuestion({
    required String gameId,
    required String question,
    required String? hint,
    required bool isDouble,
    required int timeInSeconds,
    required List<String> answers,
  }) async {
    final HttpsCallable callable = _firebaseFunctions.httpsCallable(_sendQuestion);
    HttpsCallableResult result = await callable.call<dynamic>(<String, dynamic>{
      'game_id': gameId,
      'question': question,
      'hint': hint,
      'is_double': isDouble,
      'time_in_seconds': timeInSeconds,
      'answers': answers,
    });

    return DateTime.parse(result.data['finish_when']);
  }

  Future<void> sendAnswer({
    required String gameId,
    required String token,
    required int answerIndex,
    required bool wasHintUsed,
  }) async {
    final HttpsCallable callable = _firebaseFunctions.httpsCallable(_sendAnswer);
    await callable.call<dynamic>(<String, dynamic>{
      'game_id': gameId,
      'token': token,
      'answer_index': answerIndex,
      'was_hint_used': wasHintUsed,
    });
  }
}
