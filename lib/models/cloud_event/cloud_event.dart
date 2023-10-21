import 'package:equatable/equatable.dart';

sealed class CloudEvent extends Equatable {
  const CloudEvent();
}

class PlayerJoinedCloudEvent extends CloudEvent {
  const PlayerJoinedCloudEvent({
    required this.username,
  });

  final String username;

  @override
  List<Object?> get props => <Object?>[
        username,
      ];
}
