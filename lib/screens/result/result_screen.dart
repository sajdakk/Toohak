import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/widgets/loading_view.dart';

import 'cubit/result_cubit.dart';
import 'result_body.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.event,
  });

  final RoundFinishedCloudEvent? event;

  static String getRoute() {
    return '/result';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (context == null) {
        return const ResultScreen(
          event: null,
        );
      }

      final RoundFinishedCloudEvent? event = context.settings?.arguments as RoundFinishedCloudEvent?;
      return ResultScreen(
        event: event,
      );
    },
  );

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultCubit>(
      create: (_) => sl()..init(),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (_, ResultState state) {
          if (state is ResultLoadingState) {
            return const LoadingView();
          }

          if (widget.event == null) {
            return ErrorView.unhandledState(state);
          }

          if (state is ResultLoadedState) {
            return ResultBody(
              event: widget.event!,
            );
          }

          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
