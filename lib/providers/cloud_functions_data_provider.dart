import 'package:cloud_functions/cloud_functions.dart';
import 'package:toohak/_toohak.dart';

class CloudFunctionsDataProvider {
  final FirebaseFunctions _firebaseFunctions = sl();
  static const String _joinGame = 'joinGame';

  Future<void> joinGame({
    required String code,
    required String username,
    required String token,
  }) async {
    final HttpsCallable callable = _firebaseFunctions.httpsCallable(_joinGame);
    await callable.call<dynamic>(<String, dynamic>{
      'code': code,
      'username': username,
      'token': token,
    });
  }
}
