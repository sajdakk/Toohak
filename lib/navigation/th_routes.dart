import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/admin_screen.dart';
import 'package:toohak/screens/auth/login/login_screen.dart';
import 'package:toohak/screens/auth/registration/registration_screen.dart';
import 'package:toohak/screens/init/init_screen.dart';
import 'package:toohak/screens/template_details/template_details_screen.dart';

class ThRoutes {
  const ThRoutes();

  static final List<ThRoute> allRoutes = <ThRoute>[
    init,
    admin,
    templateDetails,
    registration,
    login,
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

  static final ThRoute templateDetails = ThRoute(
    name: 'Template details',
    route: '/templates/:id',
    handler: TemplateDetailsScreen.routeHandler,
  );

  static final ThRoute registration = ThRoute(
    name: 'Registration',
    route: '/registration',
    handler: RegistrationScreen.routeHandler,
  );

  static final ThRoute login = ThRoute(
    name: 'Login',
    route: '/login',
    handler: LoginScreen.routeHandler,
  );
}
