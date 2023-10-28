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
    this.finishWhen,
  });

  final DateTime? finishWhen;

  static String getRoute() {
    return '/question';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (context == null) {
        return const QuestionScreen();
      }

      DateTime? finishWhen = ModalRoute.of(context)?.settings.arguments as DateTime?;

      return QuestionScreen(
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
          finishWhen: widget.finishWhen,
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
              question: state.question,
              finishWhen: widget.finishWhen!,
            );
          }

          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
