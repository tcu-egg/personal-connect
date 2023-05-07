// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      iconUrl: json['iconUrl'] as String?,
      snsUrl: json['snsUrl'] as String?,
      univInfo: json['univInfo'] as String?,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'iconUrl': instance.iconUrl,
      'snsUrl': instance.snsUrl,
      'univInfo': instance.univInfo,
      'gender': _$GenderEnumMap[instance.gender]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$GenderEnumMap = {
  Gender.none: 'none',
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
