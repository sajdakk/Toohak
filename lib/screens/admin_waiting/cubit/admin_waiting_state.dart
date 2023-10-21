part of 'admin_waiting_cubit.dart';

abstract class AdminWaitingState extends Equatable {
  const AdminWaitingState();
  @override
  List<Object?> get props => <dynamic>[];
}

class AdminWaitingLoadingState extends AdminWaitingState {
  const AdminWaitingLoadingState();
}

class AdminWaitingLoadedState extends AdminWaitingState {
  const AdminWaitingLoadedState({
    required this.nicknames,
  });
  final List<String> nicknames;

  static const empty = AdminWaitingLoadedState(
    nicknames: <String>[],
  );

  @override
  List<dynamic> get props => <dynamic>[
        nicknames,
      ];
}
