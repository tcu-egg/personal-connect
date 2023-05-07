// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date.dart';

part 'following.freezed.dart';
part 'following.g.dart';

@freezed
class Following with _$Following {
  const factory Following({
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Following;

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);

  factory Following.withDefaults({
    required String userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = timeNow();
    return Following(
      userId: userId,
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }
}
