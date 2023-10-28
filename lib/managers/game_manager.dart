import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:toohak/_toohak.dart';

class GameManager {
  GameManager({
    required CloudFunctionsManager cloudFunctionsManager,
  }) : _cloudFunctionsManager = cloudFunctionsManager;

  final CloudFunctionsManager _cloudFunctionsManager;

  int questionIndex = -1;
  List<RankingPlayer> rankingPlayers = <RankingPlayer>[];
  GameTemplate? _gameTemplate;
  Game? _game;

  Future<bool> init() async {
    return true;
  }

  void setGame(Game game, GameTemplate gameTemplate) {
    _game = game;
    _gameTemplate = gameTemplate;
    clean();
  }

  Game? get game => _game;
  GameTemplate? get gameTemplate => _gameTemplate;

  Future<DateTime?> sendQuestion() async {
    if (_gameTemplate == null || _game == null) {
      return null;
    }
    questionIndex++;
    Question? question = currentQuestion;
    if (question == null) {
      return null;
    }

    BotToast.showLoading();

    DateTime? finishWhen = await _cloudFunctionsManager.sendQuestion(
      gameId: _game!.id,
      question: question.question,
      hint: question.hint,
      isDouble: question.doubleBoost,
      timeInSeconds: question.durationInSec,
      answers: question.answers,
    );

    BotToast.closeAllLoading();
    return finishWhen;
  }

  Future<bool> finishRound() async {
    if (_gameTemplate == null || _game == null) {
      return false;
    }
    BotToast.showLoading();

    int maxPoints = 1000;
    Question question = _gameTemplate!.questions[questionIndex];

    if (question.doubleBoost) {
      maxPoints *= 2;
    }

    List<RankingPlayer> result = await _cloudFunctionsManager.finishRound(
      gameId: _game!.id,
      currentRanking: rankingPlayers,
      correctAnswerIndex: question.correctAnswerIndex,
      maxPoints: maxPoints,
    );

    rankingPlayers = result;
    print("rankingPlayers: " + rankingPlayers.toString());
    BotToast.closeAllLoading();
    return true;
  }

  void clean() {
    questionIndex = -1;
    rankingPlayers = <RankingPlayer>[];
  }

  Question? get currentQuestion {
    if (_gameTemplate == null) {
      return null;
    }

    if (questionIndex >= _gameTemplate!.questions.length) {
      return null;
    }

    return _gameTemplate!.questions[questionIndex];
  }
}
