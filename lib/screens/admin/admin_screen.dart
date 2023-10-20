import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';

import 'admin_body.dart';
import 'cubit/admin_cubit.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  static const String rawRoute = '/admin';

  static String getRoute() {
    return rawRoute;
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const AdminScreen();
    },
  );

  @override
  Widget build(BuildContext context) {
    return ThAppScaffold(
      body: SafeArea(
        child: BlocProvider<AdminCubit>(
          create: (_) => sl()..init(),
          child: BlocBuilder<AdminCubit, AdminState>(
            builder: (BuildContext lessonContext, AdminState lessonState) {
              switch (lessonState) {
                case AdminLoadedState():
                  return AdminBody(
                    noDataState: null,
                    loadedState: lessonState,
                  );
                case AdminNoDataState():
                  return AdminBody(
                    loadedState: null,
                    noDataState: lessonState,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
