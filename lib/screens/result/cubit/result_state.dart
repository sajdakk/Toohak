part of 'result_cubit.dart';

abstract class ResultState extends Equatable {
  const ResultState();
  @override
  List<Object?> get props => <dynamic>[];
}

class ResultLoadedState extends ResultState {
  const ResultLoadedState();

  @override
  List<Object?> get props => <Object?>[];
}

class ResultLoadingState extends ResultState {
  const ResultLoadingState();
}

class ResultErrorState extends ResultState {
  const ResultErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[
        message,
      ];
}
