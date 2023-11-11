import 'package:toohak/_toohak.dart';

class CloudFunctionsManager {
  final CloudFunctionsDataProvider _cloudFunctionsDataProvider = sl();

  Future<String?> joinGame({
    required String code,
    required String username,
    required String token,
  }) async {
    try {
      return await _cloudFunctionsDataProvider.joinGame(
        code: code,
        username: username,
        token: token,
      );
    } catch (e, _) {
      return null;
    }
  }

  Future<List<RankingPlayer>> finishRound({
    required String gameId,
    required int correctAnswerIndex,
    required int maxPoints,
    required List<RankingPlayer> currentRanking,
  }) async {
    try {
      return await _cloudFunctionsDataProvider.finishRound(
        gameId: gameId,
        correctAnswerIndex: correctAnswerIndex,
        maxPoints: maxPoints,
        currentRanking: currentRanking,
      );
    } catch (e, _) {
      return <RankingPlayer>[];
    }
  }

  Future<DateTime?> sendQuestion({
    required String gameId,
    required String question,
    required String? hint,
    required bool isDouble,
    required bool isHardcore,
    required int timeInSeconds,
    required List<String> answers,
  }) async {
    try {
      return await _cloudFunctionsDataProvider.sendQuestion(
        gameId: gameId,
        question: question,
        hint: hint,
        isDouble: isDouble,
        isHardcore: isHardcore,
        timeInSeconds: timeInSeconds,
        answers: answers,
      );
    } catch (e, _) {
      return null;
    }
  }

  Future<bool> sendAnswer({
    required String gameId,
    required String token,
    required int answerIndex,
    required bool wasHintUsed,
  }) async {
    try {
      await _cloudFunctionsDataProvider.sendAnswer(
        gameId: gameId,
        token: token,
        answerIndex: answerIndex,
        wasHintUsed: wasHintUsed,
      );
      return true;
    } catch (e, _) {
      return false;
    }
  }
}
