import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/widgets/loading_view.dart';

import 'cubit/question_cubit.dart';
import 'question_body.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.gameId,
    required this.gameTemplateId,
    this.finishWhen,
  });

  final String gameId;
  final String gameTemplateId;
  final DateTime? finishWhen;

  static String getRoute({
    required String gameId,
    required String gameTemplateId,
  }) {
    return '/question/$gameId?game-template-id=$gameTemplateId';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      final String gameId = params['game-id']?.first;
      final String gameTemplateId = params['game-template-id']?.first;

      if (context == null) {
        return QuestionScreen(
          gameId: gameId,
          gameTemplateId: gameTemplateId,
        );
      }

      DateTime? finishWhen = ModalRoute.of(context)?.settings.arguments as DateTime?;

      return QuestionScreen(
        gameId: gameId,
        gameTemplateId: gameTemplateId,
        finishWhen: finishWhen,
      );
    },
  );

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionCubit>(
      create: (_) => sl()
        ..init(
          gameTemplateId: widget.gameTemplateId,
          finishWhen: widget.finishWhen,
          gameId: widget.gameId,
        ),
      child: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (_, QuestionState state) {
          if (state is QuestionLoadingState) {
            return const LoadingView();
          }

          if (widget.finishWhen == null) {
            return ErrorView.unhandledState(state);
          }

          if (state is QuestionLoadedState) {
            return QuestionBody(
              gameId: widget.gameId,
              gameTemplate: state.gameTemplate,
              finishWhen: widget.finishWhen!,
            );
          }

          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
