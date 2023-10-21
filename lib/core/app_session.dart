import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toohak/_toohak.dart';

final AppSession appSession = AppSession.instance;

class AppSession {
  static AppSession get instance => sl();

  final AuthManager _authManager = sl();
  final FirebaseAuth _firebaseAuth = sl();
  final ProfilesDataManager _profileManager = sl();

  final BehaviorSubject<CurrentAppSession?> _currentAppSession$ = BehaviorSubject<CurrentAppSession?>.seeded(null);

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get isValid => _currentAppSession$.value != null;

  Stream<CurrentAppSession?> get currentAppSession$ => _currentAppSession$.stream;
  StreamSubscription<dynamic>? _firebaseSession;

  final Logger _logger = Logger('AppSession');

  Future<void> init() async {
    _firebaseSession ??= _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        _currentAppSession$.add(null);
        thRouter.pushNamed(ThRoutes.login.route);
        _logger.info('init, user is null');
      }
    });

    final String? userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) {
      thRouter.pushNamed(ThRoutes.login.route);
      return;
    }

    bool result = true;
    await _profileManager.fetchWithId(userId);
    final Profile? profile = _profileManager.lastKnownValueForId(userId);
    if (profile == null) {
      result = await _authManager.createOrReplaceProfile();
    }
    if (!result) {
      _logger.info('init, could not create profile');

      return;
    }

    if (!result) {
      _logger.info('init, could not create th_user');

      return;
    }

    if (isAppProfileValid) {
      _currentAppSession$.add(
        CurrentAppSession(
          profile: profile!,
          user: _firebaseAuth.currentUser!,
        ),
      );
      thRouter.removeAllAndPush(ThRoutes.admin.route);
      _logger.info('init, profile is valid');
    }

    if (!isAppProfileValid) {
      thRouter.pushNamed(ThRoutes.login.route);
      _logger.info('init, profile is not valid');
    }
  }

  CurrentAppSession get validatedCurrentSession {
    if (_currentAppSession$.value == null) {
      signOut();
      _logger.error('validatedCurrentSession, session is not valid!');
      throw Exception('Session is not valid!');
    }

    return _currentAppSession$.value!;
  }

  bool get isAppProfileValid {
    final Profile? profile = _profileManager.lastKnownValueForId(_firebaseAuth.currentUser!.uid);
    if (profile == null) {
      return false;
    }

    return true;
  }

  Future<void> signOut() async {
    _currentAppSession$.add(null);
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.signOut();
    }
  }
}
