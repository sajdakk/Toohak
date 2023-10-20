import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin/cubit/admin_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton(FirebaseFirestore.instance);
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(PackageInfoManager()..init());
  sl.registerSingleton(ThRouter()..init(ThRoutes.allRoutes));

// managers

//data managers

  sl.registerLazySingleton(() => NavigationManager());

//data providers

//cubits
  sl.registerFactory(() => AdminCubit());
}

Future<void> fetchAllData() async {}
