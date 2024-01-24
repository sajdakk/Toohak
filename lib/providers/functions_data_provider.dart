import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:toohak/_toohak.dart';

class FunctionsDataProvider {
  Future<String> joinGame({
    required String code,
    required String username,
  }) async {
    final Response response = await Dio().post(
      '$serverUrl/join_game',
      data: <String, dynamic>{
        'code': code,
        'username': username,
      },
    );

    sl<CloudEventsManager>().connect(
      token: response.data['token'],
      gameId: response.data['game_id'],
    );

    return response.data['game_id'];
  }

  Future<List<RankingPlayer>> finishRound({
    required String gameId,
    required int correctAnswerIndex,
    required int maxPoints,
    required List<RankingPlayer> currentRanking,
  }) async {
    String? adminToken = await appSession.currentUser?.getIdToken();
    if (adminToken == null) {
      throw Exception('Could not get adminToken');
    }

    final Response response = await Dio().post(
      '$serverUrl/finish_round',
      data: <String, dynamic>{
        'game_id': gameId,
        'correct_answer_index': correctAnswerIndex,
        'max_points': maxPoints,
        'current_ranking': jsonDecode(jsonEncode(currentRanking)),
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $adminToken',
        },
      ),
    );

    List<dynamic> rankingRaw = response.data['ranking'];
    List<RankingPlayer> ranking = rankingRaw.map((e) => RankingPlayer.fromJson(e)).toList();

    return ranking;
  }

  Future<void> finishGame({
    required String gameId,
    required List<RankingPlayer> currentRanking,
  }) async {
    String? adminToken = await appSession.currentUser?.getIdToken();
    if (adminToken == null) {
      throw Exception('Could not get adminToken');
    }

    await Dio().post(
      '$serverUrl/finish_game',
      data: <String, dynamic>{
        'game_id': gameId,
        'current_ranking': jsonDecode(jsonEncode(currentRanking)),
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $adminToken',
        },
      ),
    );
  }

  Future<DateTime> sendQuestion({
    required String gameId,
    required String question,
    required String? hint,
    required bool isDouble,
    required bool isHardcore,
    required int timeInSeconds,
    required List<String> answers,
  }) async {
    String? adminToken = await appSession.currentUser?.getIdToken();
    if (adminToken == null) {
      throw Exception('Could not get adminToken');
    }

    final Response response = await Dio().post(
      '$serverUrl/send_question',
      data: <String, dynamic>{
        'game_id': gameId,
        'question': question,
        'hint': hint,
        'is_double': isDouble,
        'time_in_seconds': timeInSeconds,
        'answers': answers,
        'is_hardcore': isHardcore,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $adminToken',
        },
      ),
    );

    return DateTime.parse(response.data['finish_when']).toLocal();
  }

  Future<void> sendAnswer({
    required String gameId,
    required String token,
    required int answerIndex,
    required bool wasHintUsed,
  }) async {
    await Dio().post(
      '$serverUrl/send_answer',
      data: <String, dynamic>{
        'game_id': gameId,
        'token': token,
        'answer_index': answerIndex,
        'was_hint_used': wasHintUsed,
      },
    );
  }
}
