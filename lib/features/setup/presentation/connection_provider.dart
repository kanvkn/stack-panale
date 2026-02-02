import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/entities/connection_config.dart';
import '../../../core/domain/entities/connection_status.dart';
import '../../../core/domain/repositories/connection_provider.dart';
import '../../../core/infrastructure/connection_factory.dart';

final connectionProvider = StateNotifierProvider<ConnectionNotifier, ConnectionStatus>((ref) {
  return ConnectionNotifier();
});

final activeConnectionConfigProvider = StateProvider<ConnectionConfig?>((ref) => null);

class ConnectionNotifier extends StateNotifier<ConnectionStatus> {
  ConnectionProvider? _provider;

  ConnectionNotifier() : super(const ConnectionStatus(state: ConnectionState.disconnected));

  Future<void> connect(ConnectionConfig config) async {
    _provider = ConnectionFactory.create(config.type);
    
    _provider!.statusStream.listen((status) {
      state = status;
    });

    await _provider!.connect(config);
  }

  Future<void> disconnect() async {
    await _provider?.disconnect();
    _provider = null;
  }

  ConnectionProvider? get provider => _provider;
}
