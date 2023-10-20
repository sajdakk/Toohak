import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoManager {
  late PackageInfo _packageInfo;

  PackageInfo get packageInfo => _packageInfo;

  String get version => _packageInfo.version;

  Future<void> init() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    _packageInfo = info;
  }
}
