import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/admin_screen.dart';
import 'package:toohak/screens/init/init_screen.dart';

class ThRoutes {
  const ThRoutes();

  static final List<ThRoute> allRoutes = <ThRoute>[
    init,
    admin,
  ];

  static const String dialogRouteName = '/dialog';

  static final ThRoute init = ThRoute(
    name: 'Init',
    route: '/',
    handler: InitScreen.routeHandler,
  );

  static final ThRoute admin = ThRoute(
    name: 'Admin',
    route: '/admin',
    handler: AdminScreen.routeHandler,
  );
}
