import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/core/service_locator.dart';

import 'cubit/player_waiting_cubit.dart';
import 'player_waiting_body.dart';

class PlayerWaitingScreen extends StatefulWidget {
  const PlayerWaitingScreen({
    super.key,
  });

  static String getRoute() {
    return '/player-waiting';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const PlayerWaitingScreen();
    },
  );

  @override
  State<PlayerWaitingScreen> createState() => _PlayerWaitingScreenState();
}

class _PlayerWaitingScreenState extends State<PlayerWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerWaitingCubit>(
      create: (_) => sl()..init(),
      child: BlocBuilder<PlayerWaitingCubit, PlayerWaitingState>(
        builder: (_, PlayerWaitingState state) {
          return const PlayerWaitingBody();
        },
      ),
    );
  }
}
