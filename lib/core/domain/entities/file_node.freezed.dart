// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileNode {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  bool get isDirectory => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  DateTime? get modified => throw _privateConstructorUsedError;
  List<FileNode>? get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileNodeCopyWith<FileNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileNodeCopyWith<$Res> {
  factory $FileNodeCopyWith(FileNode value, $Res Function(FileNode) then) =
      _$FileNodeCopyWithImpl<$Res, FileNode>;
  @useResult
  $Res call(
      {String name,
      String path,
      bool isDirectory,
      int? size,
      DateTime? modified,
      List<FileNode>? children});
}

/// @nodoc
class _$FileNodeCopyWithImpl<$Res, $Val extends FileNode>
    implements $FileNodeCopyWith<$Res> {
  _$FileNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? isDirectory = null,
    Object? size = freezed,
    Object? modified = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      isDirectory: null == isDirectory
          ? _value.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FileNode>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileNodeImplCopyWith<$Res>
    implements $FileNodeCopyWith<$Res> {
  factory _$$FileNodeImplCopyWith(
          _$FileNodeImpl value, $Res Function(_$FileNodeImpl) then) =
      __$$FileNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String path,
      bool isDirectory,
      int? size,
      DateTime? modified,
      List<FileNode>? children});
}

/// @nodoc
class __$$FileNodeImplCopyWithImpl<$Res>
    extends _$FileNodeCopyWithImpl<$Res, _$FileNodeImpl>
    implements _$$FileNodeImplCopyWith<$Res> {
  __$$FileNodeImplCopyWithImpl(
      _$FileNodeImpl _value, $Res Function(_$FileNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? isDirectory = null,
    Object? size = freezed,
    Object? modified = freezed,
    Object? children = freezed,
  }) {
    return _then(_$FileNodeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      isDirectory: null == isDirectory
          ? _value.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FileNode>?,
    ));
  }
}

/// @nodoc

class _$FileNodeImpl implements _FileNode {
  const _$FileNodeImpl(
      {required this.name,
      required this.path,
      required this.isDirectory,
      this.size,
      this.modified,
      final List<FileNode>? children})
      : _children = children;

  @override
  final String name;
  @override
  final String path;
  @override
  final bool isDirectory;
  @override
  final int? size;
  @override
  final DateTime? modified;
  final List<FileNode>? _children;
  @override
  List<FileNode>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FileNode(name: $name, path: $path, isDirectory: $isDirectory, size: $size, modified: $modified, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileNodeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.isDirectory, isDirectory) ||
                other.isDirectory == isDirectory) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, path, isDirectory, size,
      modified, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileNodeImplCopyWith<_$FileNodeImpl> get copyWith =>
      __$$FileNodeImplCopyWithImpl<_$FileNodeImpl>(this, _$identity);
}

abstract class _FileNode implements FileNode {
  const factory _FileNode(
      {required final String name,
      required final String path,
      required final bool isDirectory,
      final int? size,
      final DateTime? modified,
      final List<FileNode>? children}) = _$FileNodeImpl;

  @override
  String get name;
  @override
  String get path;
  @override
  bool get isDirectory;
  @override
  int? get size;
  @override
  DateTime? get modified;
  @override
  List<FileNode>? get children;
  @override
  @JsonKey(ignore: true)
  _$$FileNodeImplCopyWith<_$FileNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
