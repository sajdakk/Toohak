import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
    this.title = 'Wystąpił błąd',
  });

  factory ErrorView.unhandledState(Object state) {
    return ErrorView(
      error: 'Nieznany stan: $state',
    );
  }

  final String title;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(error),
        ],
      ),
    );
  }
}
