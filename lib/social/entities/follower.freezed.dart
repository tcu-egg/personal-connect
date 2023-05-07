// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Follower _$FollowerFromJson(Map<String, dynamic> json) {
  return _Follower.fromJson(json);
}

/// @nodoc
mixin _$Follower {
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerCopyWith<Follower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerCopyWith<$Res> {
  factory $FollowerCopyWith(Follower value, $Res Function(Follower) then) =
      _$FollowerCopyWithImpl<$Res, Follower>;
  @useResult
  $Res call({String userId, DateTime createdAt, DateTime updatedAt});
}

/// @nodoc
class _$FollowerCopyWithImpl<$Res, $Val extends Follower>
    implements $FollowerCopyWith<$Res> {
  _$FollowerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_FollowerCopyWith<$Res> implements $FollowerCopyWith<$Res> {
  factory _$$_FollowerCopyWith(
          _$_Follower value, $Res Function(_$_Follower) then) =
      __$$_FollowerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, DateTime createdAt, DateTime updatedAt});
}

/// @nodoc
class __$$_FollowerCopyWithImpl<$Res>
    extends _$FollowerCopyWithImpl<$Res, _$_Follower>
    implements _$$_FollowerCopyWith<$Res> {
  __$$_FollowerCopyWithImpl(
      _$_Follower _value, $Res Function(_$_Follower) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Follower(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$_Follower with DiagnosticableTreeMixin implements _Follower {
  const _$_Follower(
      {required this.userId, required this.createdAt, required this.updatedAt});

  factory _$_Follower.fromJson(Map<String, dynamic> json) =>
      _$$_FollowerFromJson(json);

  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Follower(userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Follower'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Follower &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      __$$_FollowerCopyWithImpl<_$_Follower>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowerToJson(
      this,
    );
  }
}

abstract class _Follower implements Follower {
  const factory _Follower(
      {required final String userId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_Follower;

  factory _Follower.fromJson(Map<String, dynamic> json) = _$_Follower.fromJson;

  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_FollowerCopyWith<_$_Follower> get copyWith =>
      throw _privateConstructorUsedError;
}
