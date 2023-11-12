import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/cubit/admin_cubit.dart';
import 'package:toohak/screens/admin_waiting/cubit/admin_waiting_cubit.dart';
import 'package:toohak/screens/after_answer_waiting/cubit/after_answer_waiting_cubit.dart';
import 'package:toohak/screens/answer/cubit/answer_cubit.dart';
import 'package:toohak/screens/auth/login/cubit/login_cubit.dart';
import 'package:toohak/screens/auth/registration/cubit/registration_cubit.dart';
import 'package:toohak/screens/final_ranking/cubit/final_ranking_cubit.dart';
import 'package:toohak/screens/game_over/cubit/game_over_cubit.dart';
import 'package:toohak/screens/nickname/cubit/nickname_cubit.dart';
import 'package:toohak/screens/player_waiting/cubit/player_waiting_cubit.dart';
import 'package:toohak/screens/question/cubit/question_cubit.dart';
import 'package:toohak/screens/result/cubit/result_cubit.dart';
import 'package:toohak/screens/round_ranking/cubit/round_ranking_cubit.dart';
import 'package:toohak/screens/template_details/cubit/template_details_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton(FirebaseFirestore.instance);
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(FirebaseFunctions.instance);
  sl.registerSingleton(PackageInfoManager()..init());
  sl.registerSingleton(ThRouter()..init(ThRoutes.allRoutes));

  //data providers

  sl.registerFactory(() => GameTemplateDataProvider());
  sl.registerFactory(() => GameDataProvider());
  sl.registerFactory(() => AuthProvider());
  sl.registerFactory(() => ProfilesDataProvider());
  sl.registerFactory(() => CloudFunctionsDataProvider());

  // managers
// TODO(sajdakk): Check for error
  await _registerManagers();

//data managers

  sl.registerLazySingleton(() => NavigationManager());
  sl.registerLazySingleton(() => GameTemplateDataManager());
  sl.registerLazySingleton(() => GameDataManager());
  sl.registerLazySingleton(() => AuthManager());
  sl.registerLazySingleton(() => ProfilesDataManager());

//cubits
  sl.registerFactory(() => AdminCubit());
  sl.registerFactory(() => TemplateDetailsCubit());
  sl.registerFactory(() => RegistrationCubit());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => NicknameCubit());
  sl.registerFactory(() => AdminWaitingCubit());
  sl.registerFactory(() => PlayerWaitingCubit());
  sl.registerFactory(() => AnswerCubit());
  sl.registerFactory(() => QuestionCubit());
  sl.registerFactory(() => RoundRankingCubit());
  sl.registerFactory(() => FinalRankingCubit());
  sl.registerFactory(() => AfterAnswerWaitingCubit());
  sl.registerFactory(() => ResultCubit());
  sl.registerFactory(() => GameOverCubit());

  //app session
  sl.registerSingleton(AppSession());
}

Future<bool> _registerManagers() async {
  // region CloudEventsManager

  CloudEventsManager cloudEventsManager = CloudEventsManager();
  final bool cloudEventsSuccess = await cloudEventsManager.init();
  if (!cloudEventsSuccess) {
    // Logger
    return false;
  }

  sl.registerSingleton(cloudEventsManager);

  // endregion

  // region PlayersManager

  PlayersManager playersManager = PlayersManager(
    cloudEventsManager: cloudEventsManager,
  );
  final bool playersSuccess = await playersManager.init();
  if (!playersSuccess) {
    // Logger
    return false;
  }

  sl.registerSingleton(playersManager);

  // endregion

  // region CloudFunctionsManager
  CloudFunctionsManager cloudFunctionsManager = CloudFunctionsManager();

  sl.registerSingleton(cloudFunctionsManager);

  // endregion

  // region GameManager
  GameManager questionManager = GameManager(
    cloudFunctionsManager: cloudFunctionsManager,
  );

  final bool questionSuccess = await questionManager.init();
  if (!questionSuccess) {
    // Logger
    return false;
  }

  sl.registerSingleton(questionManager);

  return true;
  // endregion
}

Future<void> fetchAllData() async {}
