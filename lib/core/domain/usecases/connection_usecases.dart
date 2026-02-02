import '../entities/connection_config.dart';
import '../repositories/connection_provider.dart';

class ConnectUseCase {
  final ConnectionProvider provider;

  ConnectUseCase(this.provider);

  Future<void> call(ConnectionConfig config) async {
    await provider.connect(config);
  }
}

class DisconnectUseCase {
  final ConnectionProvider provider;

  DisconnectUseCase(this.provider);

  Future<void> call() async {
    await provider.disconnect();
  }
}

class ExecuteCommandUseCase {
  final ConnectionProvider provider;

  ExecuteCommandUseCase(this.provider);

  Future<dynamic> call(String command) async {
    return await provider.executeCommand(command);
  }
}
