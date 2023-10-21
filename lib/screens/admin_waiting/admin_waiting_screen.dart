import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/widgets/loading_view.dart';
import 'admin_waiting_body.dart';
import 'cubit/admin_waiting_cubit.dart';

class AdminWaitingScreen extends StatefulWidget {
  const AdminWaitingScreen({
    super.key,
  });

  static String getRoute() {
    return '/admin-waiting';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const AdminWaitingScreen();
    },
  );

  @override
  State<AdminWaitingScreen> createState() => _AdminWaitingScreenState();
}

class _AdminWaitingScreenState extends State<AdminWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminWaitingCubit>(
      create: (_) => sl()..init(),
      child: BlocBuilder<AdminWaitingCubit, AdminWaitingState>(
        builder: (_, AdminWaitingState state) {
          if (state is AdminWaitingLoadedState) {
            return AdminWaitingBody(
              state: state,
            );
          }

          if (state is AdminWaitingLoadingState) {
            return const LoadingView();
          }

          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
