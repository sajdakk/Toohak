import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/core/service_locator.dart';

import 'cubit/round_ranking_cubit.dart';
import 'round_ranking_body.dart';

class RoundRankingScreen extends StatefulWidget {
  const RoundRankingScreen({
    super.key,
    required this.gameId,
    this.ranking,
  });

  final String gameId;
  final List<RankingPlayer>? ranking;

  static String getRoute(String gameId) {
    return '/round-ranking/$gameId';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final String gameId = params['game-id']?.first;

      if (context == null) {
        return RoundRankingScreen(
          gameId: gameId,
        );
      }

      List<RankingPlayer>? ranking = ModalRoute.of(context)?.settings.arguments as List<RankingPlayer>?;

      return RoundRankingScreen(
        gameId: gameId,
        ranking: ranking,
      );
    },
  );

  @override
  State<RoundRankingScreen> createState() => _RoundRankingScreenState();
}

class _RoundRankingScreenState extends State<RoundRankingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoundRankingCubit>(
      create: (_) => sl()
        ..init(
          widget.gameId,
        ),
      child: BlocBuilder<RoundRankingCubit, RoundRankingState>(
        builder: (_, RoundRankingState state) {
          return RoundRankingBody(
            ranking: widget.ranking ?? <RankingPlayer>[],
          );
        },
      ),
    );
  }
}
