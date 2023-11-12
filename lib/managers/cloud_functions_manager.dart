import 'package:cloud_functions/cloud_functions.dart';
import 'package:toohak/_toohak.dart';

class CloudFunctionsManager {
  final CloudFunctionsDataProvider _cloudFunctionsDataProvider = sl();

  Future<String?> joinGame({
    required String code,
    required String username,
  }) async {
    try {
      return await _cloudFunctionsDataProvider.joinGame(
        code: code,
        username: username,
      );
    } catch (e, _) {
      if (e is FirebaseFunctionsException && e.code == "permission-denied" && e.message == 'Username already taken') {
        ThMessage.showError('Nazwa użytkownika jest już zajęta.');
      }
      if (e is FirebaseFunctionsException &&
          e.code == "permission-denied" &&
          e.message == 'You are already in this game') {
        ThMessage.showError('Już jesteś w tej grze.');
      }
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
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return <RankingPlayer>[];
    }
  }

  Future<List<EndGameResult>> finishGame({
    required String gameId,
    required List<RankingPlayer> currentRanking,
  }) async {
    try {
      return await _cloudFunctionsDataProvider.finishGame(
        gameId: gameId,
        currentRanking: currentRanking,
      );
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);

      return <EndGameResult>[];
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
