import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/core/domain/entities/connection_config.dart';

void main() {
  group('ConnectionConfig', () {
    test('should create ConnectionConfig with required fields', () {
      final config = ConnectionConfig(
        id: 'test-id',
        name: 'Test Connection',
        type: ConnectionType.ssh,
      );

      expect(config.id, 'test-id');
      expect(config.name, 'Test Connection');
      expect(config.type, ConnectionType.ssh);
    });

    test('should create ConnectionConfig with metadata', () {
      final config = ConnectionConfig(
        id: 'test-id',
        name: 'Test Connection',
        type: ConnectionType.ssh,
        metadata: {'host': 'example.com', 'port': 22},
      );

      expect(config.metadata, isNotNull);
      expect(config.metadata!['host'], 'example.com');
      expect(config.metadata!['port'], 22);
    });
  });
}
