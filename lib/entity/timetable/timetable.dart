import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_connect/utils/date.dart';
import 'package:uuid/uuid.dart';

import 'lecture.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

typedef LectureMap = Map<int, Lecture>;

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday;

  @override
  String toString() {
    switch (this) {
      case Weekday.monday:
        return '月';
      case Weekday.tuesday:
        return '火';
      case Weekday.wednesday:
        return '水';
      case Weekday.thursday:
        return '木';
      case Weekday.friday:
        return '金';
    }
  }
}

@freezed
class Timetable with _$Timetable {
  const factory Timetable({
    required String id,
    required String name,
    required Map<Weekday, LectureMap> lectures,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);

  factory Timetable.withDefaults({
    String? id,
    String? name,
    Map<Weekday, LectureMap>? lectures,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    final now = timeNow();
    const uuid = Uuid();

    return _Timetable(
      id: id ?? uuid.v4(),
      name: name ?? '時間割',
      lectures: lectures ?? {},
      createdAt: createdAt ?? now,
      updatedAt: updatedAt ?? now,
    );
  }
}
