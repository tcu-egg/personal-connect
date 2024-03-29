// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_connect/timetable/themes/timetable_color.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';

@freezed
class Lecture with _$Lecture {
  const factory Lecture({
    required String lectureName,
    required String professorName,
    required String roomName,
    required TimetableColor color,
  }) = _Lecture;

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  factory Lecture.withDefaults({
    String lectureName = '',
    String professorName = '',
    String roomName = '',
    TimetableColor color = TimetableColor.selected1,
  }) =>
      Lecture(
        lectureName: lectureName,
        professorName: professorName,
        roomName: roomName,
        color: color,
      );
}
