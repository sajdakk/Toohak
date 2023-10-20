import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

import 'cubit/admin_cubit.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({
    super.key,
    required this.noDataState,
    required this.loadedState,
  });

  final AdminNoDataState? noDataState;
  final AdminLoadedState? loadedState;

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThButton(
            title: 'Stwórz nowy quiz',
            onTap: () {},
            size: ThPrimaryButtonSize.large,
            style: ThPrimaryButtonStyle.primary,
          ),
          const SizedBox(height: 24.0),
          const SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
