import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/core/service_locator.dart';

import 'cubit/player_waiting_cubit.dart';
import 'player_waiting_body.dart';

class PlayerWaitingScreen extends StatefulWidget {
  const PlayerWaitingScreen({
    super.key,
    required this.gameId,
  });

  final String gameId;

  static String getRoute(String gameId) {
    return '/player-waiting/$gameId';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final String gameId = params['game-id']?.first;

      return PlayerWaitingScreen(
        gameId: gameId,
      );
    },
  );

  @override
  State<PlayerWaitingScreen> createState() => _PlayerWaitingScreenState();
}

class _PlayerWaitingScreenState extends State<PlayerWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerWaitingCubit>(
      create: (_) => sl()
        ..init(
          widget.gameId,
        ),
      child: BlocBuilder<PlayerWaitingCubit, PlayerWaitingState>(
        builder: (_, PlayerWaitingState state) {
          return const PlayerWaitingBody();
        },
      ),
    );
  }
}
