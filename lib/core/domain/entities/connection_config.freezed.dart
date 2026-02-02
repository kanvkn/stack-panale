// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConnectionConfig _$ConnectionConfigFromJson(Map<String, dynamic> json) {
  return _ConnectionConfig.fromJson(json);
}

/// @nodoc
mixin _$ConnectionConfig {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ConnectionType get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionConfigCopyWith<ConnectionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionConfigCopyWith<$Res> {
  factory $ConnectionConfigCopyWith(
          ConnectionConfig value, $Res Function(ConnectionConfig) then) =
      _$ConnectionConfigCopyWithImpl<$Res, ConnectionConfig>;
  @useResult
  $Res call(
      {String id,
      String name,
      ConnectionType type,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$ConnectionConfigCopyWithImpl<$Res, $Val extends ConnectionConfig>
    implements $ConnectionConfigCopyWith<$Res> {
  _$ConnectionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? metadata = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionConfigImplCopyWith<$Res>
    implements $ConnectionConfigCopyWith<$Res> {
  factory _$$ConnectionConfigImplCopyWith(_$ConnectionConfigImpl value,
          $Res Function(_$ConnectionConfigImpl) then) =
      __$$ConnectionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ConnectionType type,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$ConnectionConfigImplCopyWithImpl<$Res>
    extends _$ConnectionConfigCopyWithImpl<$Res, _$ConnectionConfigImpl>
    implements _$$ConnectionConfigImplCopyWith<$Res> {
  __$$ConnectionConfigImplCopyWithImpl(_$ConnectionConfigImpl _value,
      $Res Function(_$ConnectionConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? metadata = freezed,
  }) {
    return _then(_$ConnectionConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectionConfigImpl implements _ConnectionConfig {
  const _$ConnectionConfigImpl(
      {required this.id,
      required this.name,
      required this.type,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$ConnectionConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ConnectionType type;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ConnectionConfig(id: $id, name: $name, type: $type, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionConfigImplCopyWith<_$ConnectionConfigImpl> get copyWith =>
      __$$ConnectionConfigImplCopyWithImpl<_$ConnectionConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionConfigImplToJson(
      this,
    );
  }
}

abstract class _ConnectionConfig implements ConnectionConfig {
  const factory _ConnectionConfig(
      {required final String id,
      required final String name,
      required final ConnectionType type,
      final Map<String, dynamic>? metadata}) = _$ConnectionConfigImpl;

  factory _ConnectionConfig.fromJson(Map<String, dynamic> json) =
      _$ConnectionConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ConnectionType get type;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionConfigImplCopyWith<_$ConnectionConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SSHConfig _$SSHConfigFromJson(Map<String, dynamic> json) {
  return _SSHConfig.fromJson(json);
}

/// @nodoc
mixin _$SSHConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get privateKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SSHConfigCopyWith<SSHConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SSHConfigCopyWith<$Res> {
  factory $SSHConfigCopyWith(SSHConfig value, $Res Function(SSHConfig) then) =
      _$SSHConfigCopyWithImpl<$Res, SSHConfig>;
  @useResult
  $Res call(
      {String host,
      int port,
      String username,
      String? password,
      String? privateKey});
}

/// @nodoc
class _$SSHConfigCopyWithImpl<$Res, $Val extends SSHConfig>
    implements $SSHConfigCopyWith<$Res> {
  _$SSHConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKey = freezed,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      privateKey: freezed == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SSHConfigImplCopyWith<$Res>
    implements $SSHConfigCopyWith<$Res> {
  factory _$$SSHConfigImplCopyWith(
          _$SSHConfigImpl value, $Res Function(_$SSHConfigImpl) then) =
      __$$SSHConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String host,
      int port,
      String username,
      String? password,
      String? privateKey});
}

/// @nodoc
class __$$SSHConfigImplCopyWithImpl<$Res>
    extends _$SSHConfigCopyWithImpl<$Res, _$SSHConfigImpl>
    implements _$$SSHConfigImplCopyWith<$Res> {
  __$$SSHConfigImplCopyWithImpl(
      _$SSHConfigImpl _value, $Res Function(_$SSHConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKey = freezed,
  }) {
    return _then(_$SSHConfigImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      privateKey: freezed == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SSHConfigImpl implements _SSHConfig {
  const _$SSHConfigImpl(
      {required this.host,
      required this.port,
      required this.username,
      this.password,
      this.privateKey});

  factory _$SSHConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SSHConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  final String username;
  @override
  final String? password;
  @override
  final String? privateKey;

  @override
  String toString() {
    return 'SSHConfig(host: $host, port: $port, username: $username, password: $password, privateKey: $privateKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SSHConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, host, port, username, password, privateKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SSHConfigImplCopyWith<_$SSHConfigImpl> get copyWith =>
      __$$SSHConfigImplCopyWithImpl<_$SSHConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SSHConfigImplToJson(
      this,
    );
  }
}

abstract class _SSHConfig implements SSHConfig {
  const factory _SSHConfig(
      {required final String host,
      required final int port,
      required final String username,
      final String? password,
      final String? privateKey}) = _$SSHConfigImpl;

  factory _SSHConfig.fromJson(Map<String, dynamic> json) =
      _$SSHConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  String get username;
  @override
  String? get password;
  @override
  String? get privateKey;
  @override
  @JsonKey(ignore: true)
  _$$SSHConfigImplCopyWith<_$SSHConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
