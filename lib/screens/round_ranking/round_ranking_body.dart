import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/question/question_screen.dart';

class RoundRankingBody extends StatefulWidget {
  const RoundRankingBody({
    super.key,
    required this.ranking,
    required this.endGameResults,
    this.isFinal = false,
  });

  final List<RankingPlayer> ranking;
  final List<EndGameResult> endGameResults;
  final bool isFinal;

  @override
  State<RoundRankingBody> createState() => _RoundRankingBodyState();
}

class _RoundRankingBodyState extends State<RoundRankingBody> {
  @override
  Widget build(BuildContext context) {
    return ThAppScaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 700.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!widget.isFinal)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    ThButton(
                                      title: 'Next question',
                                      onTap: () async {
                                        DateTime? result = await sl<GameManager>().sendQuestion();

                                        if (result != null) {
                                          thRouter.replace(
                                            QuestionScreen.getRoute(),
                                            arguments: result,
                                          );
                                        }
                                      },
                                      size: ThPrimaryButtonSize.small,
                                      style: ThPrimaryButtonStyle.secondary,
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 32.0),
                            Text(
                              'Toohak',
                              style: ThTextStyles.headlineH1Bold.copyWith(
                                color: ThColors.textText1,
                              ),
                            ),
                            const SizedBox(height: 32.0),
                            Text(
                              widget.isFinal ? 'Final Ranking, congratulations!' : 'Ranking',
                              style: ThTextStyles.headlineH1Bold.copyWith(
                                color: ThColors.textText1,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            _buildRanking(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRanking() {
    if (widget.isFinal) {
      return _buildFinalRanking();
    }

    if (widget.ranking.isEmpty) {
      return Text(
        'Ranking is empty',
        style: ThTextStyles.headlineH2Semibold.copyWith(
          color: ThColors.textText1,
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'No.',
              style: ThTextStyles.headlineH3Bold.copyWith(
                color: ThColors.textText1,
              ),
            ),
            Text(
              'Nazwa',
              style: ThTextStyles.headlineH3Bold.copyWith(
                color: ThColors.textText1,
              ),
            ),
            Text(
              'Pkt',
              style: ThTextStyles.headlineH3Bold.copyWith(
                color: ThColors.textText1,
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final RankingPlayer player = widget.ranking[index];

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${index + 1}',
                  style: ThTextStyles.headlineH3Bold.copyWith(
                    color: ThColors.textText1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      player.username,
                      style: ThTextStyles.headlineH3Bold.copyWith(
                        color: ThColors.textText1,
                      ),
                    ),
                    if (player.roundLost != null)
                      Text(
                        ' (odpadł w rundzie: ${player.roundLost})',
                        style: ThTextStyles.headlineH2Semibold.copyWith(
                          color: ThColors.textText2,
                        ),
                      ),
                  ],
                ),
                Text(
                  '${player.points}',
                  style: ThTextStyles.headlineH3Bold.copyWith(
                    color: ThColors.textText1,
                  ),
                ),
              ],
            );
          },
          itemCount: widget.ranking.length,
        ),
      ],
    );
  }

  Widget _buildFinalRanking() {
    if (widget.endGameResults.isEmpty) {
      return Text(
        'Ranking is empty',
        style: ThTextStyles.headlineH2Semibold.copyWith(
          color: ThColors.textText1,
        ),
      );
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final EndGameResult result = widget.endGameResults[index];

            return ListTile(
              leading: Text(
                '${index + 1}',
                style: ThTextStyles.headlineH1Bold.copyWith(
                  color: ThColors.textText1,
                ),
              ),
              title: Text(
                result.playerUsername,
                style: ThTextStyles.headlineH1Bold.copyWith(
                  color: ThColors.textText1,
                ),
              ),
              trailing: Text(
                '${result.points}',
                style: ThTextStyles.headlineH1Bold.copyWith(
                  color: ThColors.textText1,
                ),
              ),
            );
          },
          itemCount: widget.ranking.length,
        ),
      ],
    );
  }
}
