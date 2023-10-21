import 'package:toohak/_toohak.dart';

class CloudFunctionsManager {
  final CloudFunctionsDataProvider _cloudFunctionsDataProvider = sl();

  Future<bool> joinGame({
    required String code,
    required String username,
    required String token,
  }) async {
    try {
      await _cloudFunctionsDataProvider.joinGame(
        code: code,
        username: username,
        token: token,
      );
      return true;
    } catch (e, _) {
      print(e);
      return false;
    }
  }
}
