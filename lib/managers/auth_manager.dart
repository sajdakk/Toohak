import 'package:firebase_auth/firebase_auth.dart';
import 'package:toohak/_toohak.dart';

class AuthManager {
  final AuthProvider _authDataProvider = sl();
  final FirebaseAuth _firebaseAuth = sl();
  final ProfilesDataManager _profilesDataManager = sl();

  final Logger _logger = Logger('AuthManager');

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authDataProvider.login(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    } catch (e, stacktrace) {
      _logger.error(
        'login, error',
        error: e,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  Future<String?> signInAnonymously() async {
    try {
      return await _authDataProvider.signInAnonymously();
    } on FirebaseAuthException catch (e, stacktrace) {
      switch (e.code) {
        case "operation-not-allowed":
          _logger.error(
            "signInAnonymously, Anonymous auth hasn't been enabled for this project.",
            error: e,
            stackTrace: stacktrace,
          );
          return null;
        default:
          _logger.error(
            "signInAnonymously, unknown error",
            error: e,
            stackTrace: stacktrace,
          );
          return null;
      }
    }
  }

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      await _authDataProvider.register(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    } catch (e, stacktrace) {
      _logger.error(
        'register, error',
        error: e,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  Future<bool> createOrReplaceProfile() async {
    try {
      final User? user = _firebaseAuth.currentUser;
      if (user == null) {
        return false;
      }

      await _profilesDataManager.createWithId(
        id: user.uid,
        profileWriteRequest: const ProfileWriteRequest(
          gameTemplateIds: <String>[],
        ),
      );

      return true;
    } catch (e, stacktrace) {
      _logger.error(
        'createProfileIfNotExist, error',
        error: e,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  Future<bool> delete() async {
    try {
      await _authDataProvider.delete();
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    } catch (e, stacktrace) {
      _logger.error(
        'delete, error',
        error: e,
        stackTrace: stacktrace,
      );
      return false;
    }
  }
}
