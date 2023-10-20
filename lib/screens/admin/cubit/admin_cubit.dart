import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:itmesh_flutter_shared/flutter_shared.dart';
import 'package:toohak/_toohak.dart';

part 'admin_state.dart';

class AdminCubit extends ThCubit<AdminState> {
  AdminCubit() : super(const AdminNoDataState());

  final Logger _logger = Logger('AdminCubit');

  Future<void> init() async {
    _logger.info('Initializing AdminCubit');

    emit(
      const AdminLoadedState(),
    );
  }
}
