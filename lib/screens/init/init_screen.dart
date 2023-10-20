import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static const String route = '/';

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const InitScreen();
    },
  );

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThColors.backgroundBG0,
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
                    'Tahook',
                    style: ThTextStyles.headlineH1Bold.copyWith(
                      color: ThColors.textText1,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const ThTextInput(
                    hintText: 'Podaj kod PIN',
                  ),
                  ThButton(
                    title: 'Dołącz',
                    onTap: () {},
                    size: ThPrimaryButtonSize.large,
                    style: ThPrimaryButtonStyle.primary,
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chcesz stworzyć swój własny quiz?',
                        style: ThTextStyles.headlineH6Regular.copyWith(
                          color: ThColors.textText1,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () => thRouter.pushNamed(ThRoutes.admin.route),
                        child: Text(
                          'Przejdź tutaj!',
                          style: ThTextStyles.headlineH6Semibold.copyWith(
                            color: ThColors.ascentAscent,
                          ),
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
}
