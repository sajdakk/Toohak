import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toohak/_toohak.dart';

part 'game_template_write_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GameTemplateWriteRequest extends Equatable {
  const GameTemplateWriteRequest({
    required this.userId,
    required this.questions,
    required this.type,
    required this.name,
  });

  factory GameTemplateWriteRequest.fromJson(Map<String, dynamic> json) {
    return _$GameTemplateWriteRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GameTemplateWriteRequestToJson(this);
  }

  @JsonKey(name: GameTemplateFields.userId)
  final String userId;

  @JsonKey(name: GameTemplateFields.questions)
  final List<Question> questions;

  @JsonKey(name: GameTemplateFields.type)
  final GameType type;

  @JsonKey(name: GameTemplateFields.name)
  final String name;

  @override
  List<Object?> get props => <Object?>[
        userId,
        questions,
        type,
        name,
      ];
}
