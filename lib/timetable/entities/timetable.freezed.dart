// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<Weekday, Map<int, Lecture>> get lectures =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCopyWith<Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCopyWith<$Res> {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) then) =
      _$TimetableCopyWithImpl<$Res, Timetable>;
  @useResult
  $Res call(
      {String id,
      String name,
      Map<Weekday, Map<int, Lecture>> lectures,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TimetableCopyWithImpl<$Res, $Val extends Timetable>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lectures = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lectures: null == lectures
          ? _value.lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as Map<Weekday, Map<int, Lecture>>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimetableCopyWith<$Res> implements $TimetableCopyWith<$Res> {
  factory _$$_TimetableCopyWith(
          _$_Timetable value, $Res Function(_$_Timetable) then) =
      __$$_TimetableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Map<Weekday, Map<int, Lecture>> lectures,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_TimetableCopyWithImpl<$Res>
    extends _$TimetableCopyWithImpl<$Res, _$_Timetable>
    implements _$$_TimetableCopyWith<$Res> {
  __$$_TimetableCopyWithImpl(
      _$_Timetable _value, $Res Function(_$_Timetable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? lectures = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Timetable(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lectures: null == lectures
          ? _value._lectures
          : lectures // ignore: cast_nullable_to_non_nullable
              as Map<Weekday, Map<int, Lecture>>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Timetable with DiagnosticableTreeMixin implements _Timetable {
  const _$_Timetable(
      {required this.id,
      required this.name,
      required final Map<Weekday, Map<int, Lecture>> lectures,
      required this.createdAt,
      required this.updatedAt})
      : _lectures = lectures;

  factory _$_Timetable.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final Map<Weekday, Map<int, Lecture>> _lectures;
  @override
  Map<Weekday, Map<int, Lecture>> get lectures {
    if (_lectures is EqualUnmodifiableMapView) return _lectures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lectures);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Timetable(id: $id, name: $name, lectures: $lectures, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Timetable'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lectures', lectures))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timetable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._lectures, _lectures) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_lectures), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      __$$_TimetableCopyWithImpl<_$_Timetable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableToJson(
      this,
    );
  }
}

abstract class _Timetable implements Timetable {
  const factory _Timetable(
      {required final String id,
      required final String name,
      required final Map<Weekday, Map<int, Lecture>> lectures,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_Timetable;

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$_Timetable.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Map<Weekday, Map<int, Lecture>> get lectures;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}
