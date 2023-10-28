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
    required this.code,
    required this.gameId,
    required this.gameTemplateId,
  });

  final String code;
  final String gameId;
  final String gameTemplateId;

  static String getRoute({
    required String code,
    required String gameId,
    required String gameTemplateId,
  }) {
    return '/admin-waiting/$code?game-id=$gameId&game-template-id=$gameTemplateId';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final String code = params['code']?.first;
      final String gameId = params['game-id']?.first;
      final String gameTemplateId = params['game-template-id']?.first;

      return AdminWaitingScreen(
        code: code,
        gameId: gameId,
        gameTemplateId: gameTemplateId,
      );
    },
  );

  @override
  State<AdminWaitingScreen> createState() => _AdminWaitingScreenState();
}

class _AdminWaitingScreenState extends State<AdminWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminWaitingCubit>(
      create: (_) => sl()
        ..init(
          gameId: widget.gameId,
          gameTemplateId: widget.gameTemplateId,
        ),
      child: BlocBuilder<AdminWaitingCubit, AdminWaitingState>(
        builder: (_, AdminWaitingState state) {
          if (state is AdminWaitingLoadedState) {
            return AdminWaitingBody(
              state: state,
              code: widget.code,
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
