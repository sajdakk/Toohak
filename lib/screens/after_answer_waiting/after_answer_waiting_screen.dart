import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/core/service_locator.dart';

import 'cubit/after_answer_waiting_cubit.dart';
import 'after_answer_waiting_body.dart';

class AfterAnswerWaitingScreen extends StatefulWidget {
  const AfterAnswerWaitingScreen({
    super.key,
    required this.gameId,
  });

  final String gameId;

  static String getRoute(String gameId) {
    return '/after-answer-waiting/$gameId';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final String gameId = params['game-id']?.first;

      return AfterAnswerWaitingScreen(
        gameId: gameId,
      );
    },
  );

  @override
  State<AfterAnswerWaitingScreen> createState() => _AfterAnswerWaitingScreenState();
}

class _AfterAnswerWaitingScreenState extends State<AfterAnswerWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AfterAnswerWaitingCubit>(
      create: (_) => sl()
        ..init(
          widget.gameId,
        ),
      child: BlocBuilder<AfterAnswerWaitingCubit, AfterAnswerWaitingState>(
        builder: (_, AfterAnswerWaitingState state) {
          return const AfterAnswerWaitingBody();
        },
      ),
    );
  }
}
