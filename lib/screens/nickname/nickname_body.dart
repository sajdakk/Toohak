import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/nickname/cubit/nickname_cubit.dart';
import 'package:toohak/screens/player_waiting/player_waiting_screen.dart';

class NicknameBody extends StatefulWidget {
  const NicknameBody({
    super.key,
    required this.code,
  });

  final String code;

  @override
  State<NicknameBody> createState() => _NicknameBodyState();
}

class _NicknameBodyState extends State<NicknameBody> {
  final GlobalKey<FormFieldState<String>> _nicknameKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return ThAppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 350.0,
              ),
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
                  ThTextInput(
                    hintText: 'Podaj pseudonim',
                    isRequired: true,
                    formFieldKey: _nicknameKey,
                  ),
                  ThButton(
                    title: 'Dołączzzzzz123',
                    onTap: () async {
                      if (_nicknameKey.currentState!.validate() != true) {
                        return;
                      }

                      final String nickname = _nicknameKey.currentState!.value!;
                      NicknameCubit cubit = context.read<NicknameCubit>();
                      String? result = await cubit.joinGame(
                        code: widget.code,
                        username: nickname,
                      );

                      if (result != null) {
                        thRouter.pushNamed(PlayerWaitingScreen.getRoute(result));
                      }
                    },
                    size: ThPrimaryButtonSize.large,
                    style: ThPrimaryButtonStyle.primary,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
