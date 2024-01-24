import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/widgets/loading_view.dart';

import 'cubit/round_ranking_cubit.dart';
import 'round_ranking_body.dart';

class RoundRankingScreen extends StatefulWidget {
  const RoundRankingScreen({
    super.key,
  });

  static String getRoute() {
    return '/round-ranking';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const RoundRankingScreen();
    },
  );

  @override
  State<RoundRankingScreen> createState() => _RoundRankingScreenState();
}

class _RoundRankingScreenState extends State<RoundRankingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoundRankingCubit>(
      create: (_) => sl()..init(),
      child: BlocBuilder<RoundRankingCubit, RoundRankingState>(
        builder: (_, RoundRankingState state) {
          if (state is RoundRankingLoadingState) {
            return const LoadingView();
          }
          if (state is RoundRankingErrorState) {
            return ErrorView.unhandledState(state);
          }
          if (state is RoundRankingLoadedState) {
            return RoundRankingBody(
              ranking: state.players,
              somebodyStillPlaying: state.somebodyStillPlaying,
            );
          }
          
          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
