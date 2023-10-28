import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/question/question_screen.dart';

class RoundRankingBody extends StatefulWidget {
  const RoundRankingBody({
    super.key,
    required this.ranking,
  });

  final List<RankingPlayer> ranking;

  @override
  State<RoundRankingBody> createState() => _RoundRankingBodyState();
}

class _RoundRankingBodyState extends State<RoundRankingBody> {
  @override
  Widget build(BuildContext context) {
    return ThAppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                          thRouter.pushNamed(
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
              Text(
                'Toohak',
                style: ThTextStyles.headlineH1Bold.copyWith(
                  color: ThColors.textText1,
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Ranking',
                style: ThTextStyles.headlineH1Bold.copyWith(
                  color: ThColors.textText1,
                ),
              ),
              const SizedBox(height: 24.0),
              if (widget.ranking.isEmpty)
                Text(
                  'Ranking is empty',
                  style: ThTextStyles.headlineH2Semibold.copyWith(
                    color: ThColors.textText1,
                  ),
                ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final RankingPlayer player = widget.ranking[index];

                  return ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: ThTextStyles.headlineH1Bold.copyWith(
                        color: ThColors.textText1,
                      ),
                    ),
                    title: Text(
                      player.username,
                      style: ThTextStyles.headlineH1Bold.copyWith(
                        color: ThColors.textText1,
                      ),
                    ),
                    trailing: Text(
                      '${player.points}',
                      style: ThTextStyles.headlineH1Bold.copyWith(
                        color: ThColors.textText1,
                      ),
                    ),
                  );
                },
                itemCount: widget.ranking.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
