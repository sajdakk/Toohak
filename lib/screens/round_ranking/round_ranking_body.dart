import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

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
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Toohak',
                  style: ThTextStyles.headlineH1Bold.copyWith(
                    color: ThColors.textText1,
                  ),
                ),
                const SizedBox(height: 32.0),
                Text(
                  'Geniusz? Czekaj na wyniki!',
                  style: ThTextStyles.headlineH1Bold.copyWith(
                    color: ThColors.textText1,
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
