import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/admin_waiting/cubit/admin_waiting_cubit.dart';

class AdminWaitingBody extends StatefulWidget {
  const AdminWaitingBody({
    super.key,
    required this.state,
  });

  final AdminWaitingLoadedState state;

  @override
  State<AdminWaitingBody> createState() => _AdminWaitingBodyState();
}

class _AdminWaitingBodyState extends State<AdminWaitingBody> {
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
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final String player = widget.state.nicknames[index];
                    return Text(
                      "$player\n",
                      style: ThTextStyles.headlineH2Bold.copyWith(
                        color: ThColors.textText1,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                  itemCount: widget.state.nicknames.length,
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
