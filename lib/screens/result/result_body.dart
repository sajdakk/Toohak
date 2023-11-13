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
                  Flexible(
                    child: Column(
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
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        if (widget.event.wasAnswerCorrect != null)
                          Column(
                            children: [
                              Text(
                                'Twoja pozycja w rankingu: ${widget.event.currentPosition}',
                                style: ThTextStyles.headlineH2Semibold.copyWith(
                                  color: ThColors.textText1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        if (widget.event.pointsForThisRound != 0)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Otrzymano: ${widget.event.pointsForThisRound} punktów',
                                style: ThTextStyles.headlineH2Semibold.copyWith(
                                  color: ThColors.textText1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        Text(
                          'Suma punktów: ${widget.event.totalPoints}',
                          style: ThTextStyles.headlineH2Semibold.copyWith(
                            color: ThColors.textText1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          _getNthText(),
                          style: ThTextStyles.headlineH2Semibold.copyWith(
                            color: ThColors.textText1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getNthText() {
    if (widget.event.answeredNth == null) {
      return '';
    }

    return 'Odpowiedziałeś jako ${widget.event.answeredNth}. osoba';
  }

  String _getInfo() {
    if (widget.event.wasAnswerCorrect == null) {
      return 'Niestety, nie zdążyłeś odpowiedzieć na czas :(';
    }

    if (widget.event.wasAnswerCorrect == true) {
      return 'Gratulacje! Twoja odpowiedź była poprawna!';
    }

    return 'Niestety, pomyliłeś się :(';
  }
}
