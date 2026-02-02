// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommandResult {
  bool get success => throw _privateConstructorUsedError;
  String get output => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get exitCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommandResultCopyWith<CommandResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandResultCopyWith<$Res> {
  factory $CommandResultCopyWith(
          CommandResult value, $Res Function(CommandResult) then) =
      _$CommandResultCopyWithImpl<$Res, CommandResult>;
  @useResult
  $Res call({bool success, String output, String? error, int? exitCode});
}

/// @nodoc
class _$CommandResultCopyWithImpl<$Res, $Val extends CommandResult>
    implements $CommandResultCopyWith<$Res> {
  _$CommandResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? output = null,
    Object? error = freezed,
    Object? exitCode = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      exitCode: freezed == exitCode
          ? _value.exitCode
          : exitCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommandResultImplCopyWith<$Res>
    implements $CommandResultCopyWith<$Res> {
  factory _$$CommandResultImplCopyWith(
          _$CommandResultImpl value, $Res Function(_$CommandResultImpl) then) =
      __$$CommandResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String output, String? error, int? exitCode});
}

/// @nodoc
class __$$CommandResultImplCopyWithImpl<$Res>
    extends _$CommandResultCopyWithImpl<$Res, _$CommandResultImpl>
    implements _$$CommandResultImplCopyWith<$Res> {
  __$$CommandResultImplCopyWithImpl(
      _$CommandResultImpl _value, $Res Function(_$CommandResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? output = null,
    Object? error = freezed,
    Object? exitCode = freezed,
  }) {
    return _then(_$CommandResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      exitCode: freezed == exitCode
          ? _value.exitCode
          : exitCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CommandResultImpl implements _CommandResult {
  const _$CommandResultImpl(
      {required this.success, required this.output, this.error, this.exitCode});

  @override
  final bool success;
  @override
  final String output;
  @override
  final String? error;
  @override
  final int? exitCode;

  @override
  String toString() {
    return 'CommandResult(success: $success, output: $output, error: $error, exitCode: $exitCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.exitCode, exitCode) ||
                other.exitCode == exitCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, success, output, error, exitCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandResultImplCopyWith<_$CommandResultImpl> get copyWith =>
      __$$CommandResultImplCopyWithImpl<_$CommandResultImpl>(this, _$identity);
}

abstract class _CommandResult implements CommandResult {
  const factory _CommandResult(
      {required final bool success,
      required final String output,
      final String? error,
      final int? exitCode}) = _$CommandResultImpl;

  @override
  bool get success;
  @override
  String get output;
  @override
  String? get error;
  @override
  int? get exitCode;
  @override
  @JsonKey(ignore: true)
  _$$CommandResultImplCopyWith<_$CommandResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
