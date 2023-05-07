// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Following _$$_FollowingFromJson(Map<String, dynamic> json) => _$_Following(
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_FollowingToJson(_$_Following instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
