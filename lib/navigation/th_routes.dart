import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/admin_screen.dart';
import 'package:toohak/screens/admin_waiting/admin_waiting_screen.dart';
import 'package:toohak/screens/after_answer_waiting/after_answer_waiting_screen.dart';
import 'package:toohak/screens/answer/answer_screen.dart';
import 'package:toohak/screens/auth/login/login_screen.dart';
import 'package:toohak/screens/auth/registration/registration_screen.dart';
import 'package:toohak/screens/final_ranking/final_ranking_screen.dart';
import 'package:toohak/screens/init/init_screen.dart';
import 'package:toohak/screens/nickname/nickname_screen.dart';
import 'package:toohak/screens/player_waiting/player_waiting_screen.dart';
import 'package:toohak/screens/question/question_screen.dart';
import 'package:toohak/screens/result/result_screen.dart';
import 'package:toohak/screens/round_ranking/round_ranking_screen.dart';
import 'package:toohak/screens/template_details/template_details_screen.dart';

class ThRoutes {
  const ThRoutes();

  static final List<ThRoute> allRoutes = <ThRoute>[
    init,
    admin,
    templateDetails,
    registration,
    login,
    nickname,
    playerWaiting,
    adminWaiting,
    answer,
    question,
    afterAnswerWaiting,
    roundRanking,
    finalRanking,
    result,
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

  static final ThRoute nickname = ThRoute(
    name: 'Nickname',
    route: '/nickname/:code',
    handler: NicknameScreen.routeHandler,
  );

  static final ThRoute registration = ThRoute(
    name: 'Registration',
    route: '/registration',
    handler: RegistrationScreen.routeHandler,
  );

  static final ThRoute answer = ThRoute(
    name: 'Answer',
    route: '/answer/:game-id',
    handler: AnswerScreen.routeHandler,
  );
  static final ThRoute roundRanking = ThRoute(
    name: 'Round ranking',
    route: '/round-ranking',
    handler: RoundRankingScreen.routeHandler,
  );
  static final ThRoute finalRanking = ThRoute(
    name: 'Final ranking',
    route: '/final-ranking',
    handler: FinalRankingScreen.routeHandler,
  );

  static final ThRoute question = ThRoute(
    name: 'Question',
    route: '/question',
    handler: QuestionScreen.routeHandler,
  );

  static final ThRoute result = ThRoute(
    name: 'Result',
    route: '/result/:game-id',
    handler: ResultScreen.routeHandler,
  );

  static final ThRoute playerWaiting = ThRoute(
    name: 'Player waiting',
    route: '/player-waiting/:game-id',
    handler: PlayerWaitingScreen.routeHandler,
  );

  static final ThRoute afterAnswerWaiting = ThRoute(
    name: 'After answer waiting',
    route: '/after-answer-waiting/:game-id',
    handler: AfterAnswerWaitingScreen.routeHandler,
  );

  static final ThRoute adminWaiting = ThRoute(
    name: 'Admin waiting',
    route: '/admin-waiting/:code',
    handler: AdminWaitingScreen.routeHandler,
  );

  static final ThRoute login = ThRoute(
    name: 'Login',
    route: '/login',
    handler: LoginScreen.routeHandler,
  );
}
