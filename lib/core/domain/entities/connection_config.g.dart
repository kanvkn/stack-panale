// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionConfigImpl _$$ConnectionConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$ConnectionConfigImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ConnectionTypeEnumMap, json['type']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ConnectionConfigImplToJson(
        _$ConnectionConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ConnectionTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
    };

const _$ConnectionTypeEnumMap = {
  ConnectionType.termux: 'termux',
  ConnectionType.ssh: 'ssh',
  ConnectionType.local: 'local',
};

_$SSHConfigImpl _$$SSHConfigImplFromJson(Map<String, dynamic> json) =>
    _$SSHConfigImpl(
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      username: json['username'] as String,
      password: json['password'] as String?,
      privateKey: json['privateKey'] as String?,
    );

Map<String, dynamic> _$$SSHConfigImplToJson(_$SSHConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'username': instance.username,
      'password': instance.password,
      'privateKey': instance.privateKey,
    };
