import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/answer/answer_screen.dart';

part 'result_state.dart';

class ResultCubit extends ThCubit<ResultState> {
  ResultCubit() : super(const ResultLoadedState());

  final CloudEventsManager _cloudEventsManager = sl();
  StreamSubscription<dynamic>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  Future<void> init(String gameId) async {


    _subscription = _cloudEventsManager.cloudEvents.listen(
      (CloudEvent event) {
        if (event is QuestionSentCloudEvent) {
          thRouter.pushNamed(
            AnswerScreen.getRoute(gameId),
            arguments: event,
          );
        }
      },
    );
  }
}
