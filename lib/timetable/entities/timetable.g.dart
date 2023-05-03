// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timetable _$$_TimetableFromJson(Map<String, dynamic> json) => _$_Timetable(
      id: json['id'] as String,
      name: json['name'] as String,
      lectures: (json['lectures'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$WeekdayEnumMap, k),
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  int.parse(k), Lecture.fromJson(e as Map<String, dynamic>)),
            )),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_TimetableToJson(_$_Timetable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lectures': instance.lectures.map((k, e) => MapEntry(
          _$WeekdayEnumMap[k]!, e.map((k, e) => MapEntry(k.toString(), e)))),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
};
