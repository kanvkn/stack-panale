import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_status.freezed.dart';

enum ConnectionState { disconnected, connecting, connected, error }

@freezed
class ConnectionStatus with _$ConnectionStatus {
  const factory ConnectionStatus({
    required ConnectionState state,
    String? message,
    DateTime? connectedAt,
  }) = _ConnectionStatus;
}
