import 'package:toohak/_toohak.dart';

class GameDataManager extends DataManager<Game, NoFetchingParams> {
  final GameDataProvider _gameDataProvider = sl();
  final Logger _logger = Logger('GameDataManager');

  Game? dataWithId(String id) => lastKnownValues.firstWhereOrNull((Game game) => game.id == id);

  @override
  Future<Map<String, Game>> fetch(NoFetchingParams params) {
    return _gameDataProvider.fetchAll();
  }

  Future<bool> fetchWithId(String id) async {
    try {
      final Game? result = await _gameDataProvider.getWithId(id);
      updateStreamWith(<String, Game?>{id: result});
      return true;
    } catch (e, stacktrace) {
      _logger.error(
        'fetchWithId, could not fetch witch id game',
        error: e,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  Future<String?> addGame({
    required GameWriteRequest gameWriteRequest,
  }) async {
    try {
      final String id = await _gameDataProvider.addGame(
        gameWriteRequest: gameWriteRequest,
      );
      await fetchWithId(id);
      return id;
    } catch (error, stacktrace) {
      _logger.error(
        'addGame, could not add game',
        error: error,
        stackTrace: stacktrace,
      );
      return null;
    }
  }

  Future<bool> updateGame({
    required String id,
    required GameWriteRequest gameWriteRequest,
  }) async {
    try {
      await _gameDataProvider.updateGame(
        id: id,
        gameWriteRequest: gameWriteRequest,
      );
      await fetchWithId(id);
      return true;
    } catch (error, stacktrace) {
      _logger.error(
        'updateGame, could not update game',
        error: error,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  Future<bool> deleteGame({
    required String id,
  }) async {
    try {
      await _gameDataProvider.deleteGame(id);
      await fetchWithId(id);
      return true;
    } catch (error, stacktrace) {
      _logger.error(
        'deleteGame, could not delete game',
        error: error,
        stackTrace: stacktrace,
      );
      return false;
    }
  }
}
