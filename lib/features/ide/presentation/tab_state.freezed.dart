// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditorTab {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isDirty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditorTabCopyWith<EditorTab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorTabCopyWith<$Res> {
  factory $EditorTabCopyWith(EditorTab value, $Res Function(EditorTab) then) =
      _$EditorTabCopyWithImpl<$Res, EditorTab>;
  @useResult
  $Res call(
      {String id, String name, String path, String content, bool isDirty});
}

/// @nodoc
class _$EditorTabCopyWithImpl<$Res, $Val extends EditorTab>
    implements $EditorTabCopyWith<$Res> {
  _$EditorTabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? content = null,
    Object? isDirty = null,
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
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditorTabImplCopyWith<$Res>
    implements $EditorTabCopyWith<$Res> {
  factory _$$EditorTabImplCopyWith(
          _$EditorTabImpl value, $Res Function(_$EditorTabImpl) then) =
      __$$EditorTabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String path, String content, bool isDirty});
}

/// @nodoc
class __$$EditorTabImplCopyWithImpl<$Res>
    extends _$EditorTabCopyWithImpl<$Res, _$EditorTabImpl>
    implements _$$EditorTabImplCopyWith<$Res> {
  __$$EditorTabImplCopyWithImpl(
      _$EditorTabImpl _value, $Res Function(_$EditorTabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? content = null,
    Object? isDirty = null,
  }) {
    return _then(_$EditorTabImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isDirty: null == isDirty
          ? _value.isDirty
          : isDirty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditorTabImpl implements _EditorTab {
  const _$EditorTabImpl(
      {required this.id,
      required this.name,
      required this.path,
      required this.content,
      this.isDirty = false});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
  @override
  final String content;
  @override
  @JsonKey()
  final bool isDirty;

  @override
  String toString() {
    return 'EditorTab(id: $id, name: $name, path: $path, content: $content, isDirty: $isDirty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorTabImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isDirty, isDirty) || other.isDirty == isDirty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, path, content, isDirty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorTabImplCopyWith<_$EditorTabImpl> get copyWith =>
      __$$EditorTabImplCopyWithImpl<_$EditorTabImpl>(this, _$identity);
}

abstract class _EditorTab implements EditorTab {
  const factory _EditorTab(
      {required final String id,
      required final String name,
      required final String path,
      required final String content,
      final bool isDirty}) = _$EditorTabImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  String get content;
  @override
  bool get isDirty;
  @override
  @JsonKey(ignore: true)
  _$$EditorTabImplCopyWith<_$EditorTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
