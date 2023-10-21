// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileWriteRequest _$ProfileWriteRequestFromJson(Map<String, dynamic> json) =>
    ProfileWriteRequest(
      gameTemplateIds: (json['gameTemplateIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfileWriteRequestToJson(
        ProfileWriteRequest instance) =>
    <String, dynamic>{
      'gameTemplateIds': instance.gameTemplateIds,
    };
