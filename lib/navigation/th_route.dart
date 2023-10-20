import 'package:fluro/fluro.dart';

class ThRoute {
  const ThRoute({
    required this.route,
    required this.name,
    required this.handler,
  });

  final String route;
  final String name;
  final Handler handler;
}
