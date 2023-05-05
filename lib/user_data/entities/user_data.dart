// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String displayName,
    String? iconUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.withDefaults({
    required String displayName,
    String? iconUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = timeNow();
    return UserData(
      displayName: displayName,
      iconUrl: iconUrl,
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }
}
