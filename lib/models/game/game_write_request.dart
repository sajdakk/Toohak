import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toohak/_toohak.dart';

part 'game_write_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GameWriteRequest extends Equatable {
  const GameWriteRequest({
    required this.gameTemplateId,
    required this.code,
    required this.signUpBlocked,
    required this.adminToken,
  });

  factory GameWriteRequest.fromJson(Map<String, dynamic> json) {
    return _$GameWriteRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GameWriteRequestToJson(this);
  }

  @JsonKey(name: GameFields.gameTemplateId)
  final String gameTemplateId;

  @JsonKey(name: GameFields.code)
  final String code;

  @JsonKey(name: GameFields.signUpBlocked)
  final bool signUpBlocked;

  @JsonKey(name: GameFields.adminToken)
  final String adminToken;

  @override
  List<Object?> get props => <Object?>[
        gameTemplateId,
        code,
        signUpBlocked,
        adminToken,
      ];
}
