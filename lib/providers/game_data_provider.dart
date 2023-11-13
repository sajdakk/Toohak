import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:toohak/_toohak.dart';

class GameDataProvider {
  final FirebaseFirestore _firebaseFirestore = sl();
  final Logger _logger = Logger('GameDataProvider');

  Future<Map<String, Game>> fetchAll() async {
    final QuerySnapshot<Map<String, dynamic>> result = await _firebaseFirestore.collection(Collections.games).get();

    final Map<String, Game> games = <String, Game>{};

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in result.docs) {
      final Game game = Game.fromJson(doc.data()..['id'] = doc.id);
      games[doc.id] = game;
    }

    return games;
  }

  Future<Game?> getWithId(String id) async {
    final DocumentSnapshot<Map<String, dynamic>> result =
        await _firebaseFirestore.collection(Collections.games).doc(id).get();

    if (!result.exists) {
      return null;
    }

    return Game.fromJson(result.data()!..['id'] = result.id);
  }

  Future<String> addGame({
    required GameWriteRequest gameWriteRequest,
  }) async {
    String? adminToken = await appSession.currentUser?.getIdToken();
    if (adminToken == null) {
      throw Exception('Could not get adminToken');
    }

    final Response response = await Dio().post(
      '$serverUrl/create_game',
      data: {
        'template_id': gameWriteRequest.gameTemplateId,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $adminToken',
        },
      ),
    );

    if (response.statusCode != 200) {
      _logger.info(
        'addGame, Could not create game, status code: ${response.statusCode}',
      );

      throw Exception('Could not create game');
    }

    String gameId = response.data['game_id'];
    String token = response.data['token'];

    sl<CloudEventsManager>().connect(
      token: token,
      gameId: gameId,
    );

    _logger.info(
      'addGame, New game created with id: $gameId',
    );

    return gameId;
  }

  Future<void> updateGame({
    required String id,
    required GameWriteRequest gameWriteRequest,
  }) async {
    await _firebaseFirestore.collection(Collections.games).doc(id).update(jsonDecode(jsonEncode(gameWriteRequest)));
  }

  Future<void> deleteGame(String id) async {
    await _firebaseFirestore.collection(Collections.games).doc(id).delete();
  }
}
