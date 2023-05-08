// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date.dart';
import 'gender.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String userId,
    required String displayName,
    String? iconUrl,
    String? snsUrl,
    String? univInfo,
    required Gender gender,
    String? statusMessage,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  factory UserData.withDefaults({
    required String userId,
    required String displayName,
    String? iconUrl,
    String? snsUrl,
    String? univInfo,
    Gender? gender,
    String? statusMessage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = timeNow();
    return UserData(
      userId: userId,
      displayName: displayName,
      snsUrl: snsUrl,
      univInfo: univInfo,
      iconUrl: iconUrl,
      gender: gender ?? Gender.none,
      statusMessage: statusMessage,
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }
}
