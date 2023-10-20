part of 'admin_cubit.dart';

sealed class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object?> get props => <dynamic>[];
}

class AdminNoDataState extends AdminState {
  const AdminNoDataState();
}

class AdminLoadedState extends AdminState {
  const AdminLoadedState();

  @override
  List<dynamic> get props => <dynamic>[];
}
