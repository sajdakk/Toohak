import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/cubit/admin_cubit.dart';
import 'package:toohak/screens/auth/login/cubit/login_cubit.dart';
import 'package:toohak/screens/auth/registration/cubit/registration_cubit.dart';
import 'package:toohak/screens/template_details/cubit/template_details_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton(FirebaseFirestore.instance);
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(PackageInfoManager()..init());
  sl.registerSingleton(ThRouter()..init(ThRoutes.allRoutes));

// managers

//data managers

  sl.registerLazySingleton(() => NavigationManager());
  sl.registerLazySingleton(() => GameTemplateDataManager());
  sl.registerLazySingleton(() => AuthManager());
  sl.registerLazySingleton(() => ProfilesDataManager());

//data providers

  sl.registerFactory(() => GameTemplateDataProvider());
  sl.registerFactory(() => AuthProvider());
  sl.registerFactory(() => ProfilesDataProvider());

//cubits
  sl.registerFactory(() => AdminCubit());
  sl.registerFactory(() => TemplateDetailsCubit());
  sl.registerFactory(() => RegistrationCubit());
  sl.registerFactory(() => LoginCubit());

  //app session
  sl.registerSingleton(AppSession());
}

Future<void> fetchAllData() async {}
