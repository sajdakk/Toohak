import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';

import 'cubit/registration_cubit.dart';
import 'registration_body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static String getRoute() {
    return '/registration';
  }

  static final Handler routeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const RegistrationScreen();
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationCubit>(
      create: (_) => sl(),
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (_, RegistrationState state) {
          if (state is RegistrationLoadedState) {
            return const RegistrationBody();
          }

          return ErrorView.unhandledState(state);
        },
      ),
    );
  }
}
