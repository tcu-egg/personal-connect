// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Follower _$$_FollowerFromJson(Map<String, dynamic> json) => _$_Follower(
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_FollowerToJson(_$_Follower instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
