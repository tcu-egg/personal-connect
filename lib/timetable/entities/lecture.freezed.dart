// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lecture _$LectureFromJson(Map<String, dynamic> json) {
  return _Lecture.fromJson(json);
}

/// @nodoc
mixin _$Lecture {
  String get lectureName => throw _privateConstructorUsedError;
  String get professorName => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  TimetableColor get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LectureCopyWith<Lecture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureCopyWith<$Res> {
  factory $LectureCopyWith(Lecture value, $Res Function(Lecture) then) =
      _$LectureCopyWithImpl<$Res, Lecture>;
  @useResult
  $Res call(
      {String lectureName,
      String professorName,
      String roomName,
      TimetableColor color});
}

/// @nodoc
class _$LectureCopyWithImpl<$Res, $Val extends Lecture>
    implements $LectureCopyWith<$Res> {
  _$LectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureName = null,
    Object? professorName = null,
    Object? roomName = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      lectureName: null == lectureName
          ? _value.lectureName
          : lectureName // ignore: cast_nullable_to_non_nullable
              as String,
      professorName: null == professorName
          ? _value.professorName
          : professorName // ignore: cast_nullable_to_non_nullable
              as String,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TimetableColor,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LectureCopyWith<$Res> implements $LectureCopyWith<$Res> {
  factory _$$_LectureCopyWith(
          _$_Lecture value, $Res Function(_$_Lecture) then) =
      __$$_LectureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lectureName,
      String professorName,
      String roomName,
      TimetableColor color});
}

/// @nodoc
class __$$_LectureCopyWithImpl<$Res>
    extends _$LectureCopyWithImpl<$Res, _$_Lecture>
    implements _$$_LectureCopyWith<$Res> {
  __$$_LectureCopyWithImpl(_$_Lecture _value, $Res Function(_$_Lecture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureName = null,
    Object? professorName = null,
    Object? roomName = null,
    Object? color = null,
  }) {
    return _then(_$_Lecture(
      lectureName: null == lectureName
          ? _value.lectureName
          : lectureName // ignore: cast_nullable_to_non_nullable
              as String,
      professorName: null == professorName
          ? _value.professorName
          : professorName // ignore: cast_nullable_to_non_nullable
              as String,
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as TimetableColor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lecture with DiagnosticableTreeMixin implements _Lecture {
  const _$_Lecture(
      {required this.lectureName,
      required this.professorName,
      required this.roomName,
      required this.color});

  factory _$_Lecture.fromJson(Map<String, dynamic> json) =>
      _$$_LectureFromJson(json);

  @override
  final String lectureName;
  @override
  final String professorName;
  @override
  final String roomName;
  @override
  final TimetableColor color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Lecture(lectureName: $lectureName, professorName: $professorName, roomName: $roomName, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Lecture'))
      ..add(DiagnosticsProperty('lectureName', lectureName))
      ..add(DiagnosticsProperty('professorName', professorName))
      ..add(DiagnosticsProperty('roomName', roomName))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lecture &&
            (identical(other.lectureName, lectureName) ||
                other.lectureName == lectureName) &&
            (identical(other.professorName, professorName) ||
                other.professorName == professorName) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lectureName, professorName, roomName, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LectureCopyWith<_$_Lecture> get copyWith =>
      __$$_LectureCopyWithImpl<_$_Lecture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LectureToJson(
      this,
    );
  }
}

abstract class _Lecture implements Lecture {
  const factory _Lecture(
      {required final String lectureName,
      required final String professorName,
      required final String roomName,
      required final TimetableColor color}) = _$_Lecture;

  factory _Lecture.fromJson(Map<String, dynamic> json) = _$_Lecture.fromJson;

  @override
  String get lectureName;
  @override
  String get professorName;
  @override
  String get roomName;
  @override
  TimetableColor get color;
  @override
  @JsonKey(ignore: true)
  _$$_LectureCopyWith<_$_Lecture> get copyWith =>
      throw _privateConstructorUsedError;
}
