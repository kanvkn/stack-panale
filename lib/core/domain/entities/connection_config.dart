import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_config.freezed.dart';
part 'connection_config.g.dart';

enum ConnectionType { termux, ssh, local }

@freezed
class ConnectionConfig with _$ConnectionConfig {
  const factory ConnectionConfig({
    required String id,
    required String name,
    required ConnectionType type,
    Map<String, dynamic>? metadata,
  }) = _ConnectionConfig;

  factory ConnectionConfig.fromJson(Map<String, dynamic> json) =>
      _$ConnectionConfigFromJson(json);
}

@freezed
class SSHConfig with _$SSHConfig {
  const factory SSHConfig({
    required String host,
    required int port,
    required String username,
    String? password,
    String? privateKey,
  }) = _SSHConfig;

  factory SSHConfig.fromJson(Map<String, dynamic> json) =>
      _$SSHConfigFromJson(json);
}
