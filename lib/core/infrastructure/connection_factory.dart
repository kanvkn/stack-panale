import '../domain/entities/connection_config.dart';
import '../domain/repositories/connection_provider.dart';
import '../../features/setup/infrastructure/termux_connection_provider.dart';
import '../../features/setup/infrastructure/ssh_connection_provider.dart';
import '../../features/setup/infrastructure/local_connection_provider.dart';

class ConnectionFactory {
  static ConnectionProvider create(ConnectionType type) {
    switch (type) {
      case ConnectionType.termux:
        return TermuxConnectionProvider();
      case ConnectionType.ssh:
        return SSHConnectionProvider();
      case ConnectionType.local:
        return LocalConnectionProvider();
    }
  }
}
