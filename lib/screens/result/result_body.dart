import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class ResultBody extends StatefulWidget {
  const ResultBody({
    super.key,
    required this.event,
  });

  final RoundFinishedCloudEvent event;

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  @override
  Widget build(BuildContext context) {
    return ThAppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Toohak',
                        style: ThTextStyles.headlineH1Bold.copyWith(
                          color: ThColors.textText1,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Text(
                        _getInfo(),
                        style: ThTextStyles.headlineH2Semibold.copyWith(
                          color: ThColors.textText1,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Obecna pozycja: ${widget.event.currentPosition}',
                        style: ThTextStyles.headlineH2Semibold.copyWith(
                          color: ThColors.textText1,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (widget.event.pointsForThisRound != 0)
                        Text(
                          '+: ${widget.event.pointsForThisRound} punktów',
                          style: ThTextStyles.headlineH2Semibold.copyWith(
                            color: ThColors.textText1,
                          ),
                        ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Suma punktów: ${widget.event.totalPoints}',
                        style: ThTextStyles.headlineH2Semibold.copyWith(
                          color: ThColors.textText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getInfo() {
    if (widget.event.wasAnswerCorrect) {
      return 'Gratulacje! Twoja odpowiedź była poprawna!';
    }

    return 'Niestety, pomyliłeś się :(';
  }
}
