import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    final DocumentReference<dynamic> result =
        await _firebaseFirestore.collection(Collections.games).add(jsonDecode(jsonEncode(gameWriteRequest)));

    _logger.info(
      'addGame, New game created with id: ${result.id}',
    );

    return result.id;
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
