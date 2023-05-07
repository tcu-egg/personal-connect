// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date.dart';

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
class Follower with _$Follower {
  const factory Follower({
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Follower;

  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);

  factory Follower.withDefaults({
    required String userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = timeNow();
    return Follower(
      userId: userId,
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }
}
