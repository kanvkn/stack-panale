// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floating_window_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloatingWindow {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Widget get content => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  bool get minimized => throw _privateConstructorUsedError;
  int get zIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FloatingWindowCopyWith<FloatingWindow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingWindowCopyWith<$Res> {
  factory $FloatingWindowCopyWith(
          FloatingWindow value, $Res Function(FloatingWindow) then) =
      _$FloatingWindowCopyWithImpl<$Res, FloatingWindow>;
  @useResult
  $Res call(
      {String id,
      String title,
      Widget content,
      double x,
      double y,
      double width,
      double height,
      bool minimized,
      int zIndex});
}

/// @nodoc
class _$FloatingWindowCopyWithImpl<$Res, $Val extends FloatingWindow>
    implements $FloatingWindowCopyWith<$Res> {
  _$FloatingWindowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? minimized = null,
    Object? zIndex = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Widget,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      minimized: null == minimized
          ? _value.minimized
          : minimized // ignore: cast_nullable_to_non_nullable
              as bool,
      zIndex: null == zIndex
          ? _value.zIndex
          : zIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloatingWindowImplCopyWith<$Res>
    implements $FloatingWindowCopyWith<$Res> {
  factory _$$FloatingWindowImplCopyWith(_$FloatingWindowImpl value,
          $Res Function(_$FloatingWindowImpl) then) =
      __$$FloatingWindowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      Widget content,
      double x,
      double y,
      double width,
      double height,
      bool minimized,
      int zIndex});
}

/// @nodoc
class __$$FloatingWindowImplCopyWithImpl<$Res>
    extends _$FloatingWindowCopyWithImpl<$Res, _$FloatingWindowImpl>
    implements _$$FloatingWindowImplCopyWith<$Res> {
  __$$FloatingWindowImplCopyWithImpl(
      _$FloatingWindowImpl _value, $Res Function(_$FloatingWindowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? minimized = null,
    Object? zIndex = null,
  }) {
    return _then(_$FloatingWindowImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Widget,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      minimized: null == minimized
          ? _value.minimized
          : minimized // ignore: cast_nullable_to_non_nullable
              as bool,
      zIndex: null == zIndex
          ? _value.zIndex
          : zIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FloatingWindowImpl implements _FloatingWindow {
  const _$FloatingWindowImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.x,
      required this.y,
      required this.width,
      required this.height,
      this.minimized = false,
      this.zIndex = 1});

  @override
  final String id;
  @override
  final String title;
  @override
  final Widget content;
  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;
  @override
  @JsonKey()
  final bool minimized;
  @override
  @JsonKey()
  final int zIndex;

  @override
  String toString() {
    return 'FloatingWindow(id: $id, title: $title, content: $content, x: $x, y: $y, width: $width, height: $height, minimized: $minimized, zIndex: $zIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingWindowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.minimized, minimized) ||
                other.minimized == minimized) &&
            (identical(other.zIndex, zIndex) || other.zIndex == zIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, x, y, width, height, minimized, zIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingWindowImplCopyWith<_$FloatingWindowImpl> get copyWith =>
      __$$FloatingWindowImplCopyWithImpl<_$FloatingWindowImpl>(
          this, _$identity);
}

abstract class _FloatingWindow implements FloatingWindow {
  const factory _FloatingWindow(
      {required final String id,
      required final String title,
      required final Widget content,
      required final double x,
      required final double y,
      required final double width,
      required final double height,
      final bool minimized,
      final int zIndex}) = _$FloatingWindowImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  Widget get content;
  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;
  @override
  bool get minimized;
  @override
  int get zIndex;
  @override
  @JsonKey(ignore: true)
  _$$FloatingWindowImplCopyWith<_$FloatingWindowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
