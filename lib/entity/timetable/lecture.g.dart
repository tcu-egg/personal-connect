// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lecture _$$_LectureFromJson(Map<String, dynamic> json) => _$_Lecture(
      lectureName: json['lectureName'] as String,
      professorName: json['professorName'] as String,
      roomName: json['roomName'] as String,
      color: $enumDecode(_$TimetableColorEnumMap, json['color']),
    );

Map<String, dynamic> _$$_LectureToJson(_$_Lecture instance) =>
    <String, dynamic>{
      'lectureName': instance.lectureName,
      'professorName': instance.professorName,
      'roomName': instance.roomName,
      'color': _$TimetableColorEnumMap[instance.color]!,
    };

const _$TimetableColorEnumMap = {
  TimetableColor.unselected: 'unselected',
  TimetableColor.selected1: 'selected1',
  TimetableColor.selected2: 'selected2',
  TimetableColor.selected3: 'selected3',
  TimetableColor.selected4: 'selected4',
};
