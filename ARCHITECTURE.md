# Stack Mobile - Architecture Documentation

## Overview

Stack Mobile is a professional mobile IDE built with Flutter, following Clean Architecture and Domain-Driven Design (DDD-lite) principles.

## Architecture Layers

### 1. Domain Layer (`lib/core/domain/`)

The innermost layer containing business logic.

**Entities:**
- `ConnectionConfig` - Connection configuration
- `ConnectionStatus` - Connection state
- `CommandResult` - Command execution result
- `FileNode` - File system node
- `Message` - Chat message
- `NexiAgent` - AI agent configuration

**Use Cases:**
- `ConnectUseCase` - Establish connection
- `ExecuteCommandUseCase` - Run commands
- `ListFilesUseCase` - List files
- `ReadFileUseCase` - Read file content
- `WriteFileUseCase` - Write file content

**Repositories (Interfaces):**
- `ConnectionProvider` - Connection abstraction
- `FileRepository` - File operations
- `NexorRepository` - AI chat operations

### 2. Infrastructure Layer (`lib/core/infrastructure/`)

Implementation of domain interfaces.

**Implementations:**
- `TermuxConnectionProvider` - Termux API integration
- `SSHConnectionProvider` - SSH/SFTP integration
- `LocalConnectionProvider` - Local file system
- `FileRepositoryImpl` - File operations implementation
- `NexorRepositoryImpl` - In-memory chat storage

**Factories:**
- `ConnectionFactory` - Creates connection providers

### 3. Presentation Layer (`lib/features/*/presentation/`)

UI and state management.

**State Management:**
- Riverpod for dependency injection
- StateNotifier for complex state
- StateProvider for simple state
- FutureProvider for async data

**Screens:**
- `SetupScreen` - Connection mode selection
- `TermuxSetupScreen` - Termux configuration
- `SSHSetupScreen` - SSH configuration
- `IDEScreen` - Main IDE interface
- `NexorScreen` - AI chat interface
- `NexiMarketplace` - Agent marketplace
- `SettingsScreen` - App settings

## Design Patterns

### Strategy Pattern
Used for connection providers. Each provider implements the same interface but with different strategies.

```dart
abstract class ConnectionProvider {
  Future<void> connect(ConnectionConfig config);
  Future<CommandResult> executeCommand(String command);
  // ...
}

class TermuxConnectionProvider implements ConnectionProvider { }
class SSHConnectionProvider implements ConnectionProvider { }
class LocalConnectionProvider implements ConnectionProvider { }
```

### Repository Pattern
Abstracts data access logic.

```dart
abstract class FileRepository {
  Future<List<FileNode>> listFiles(String path);
  Future<String> readFile(String path);
  // ...
}
```

### Factory Pattern
Creates instances based on type.

```dart
class ConnectionFactory {
  static ConnectionProvider create(ConnectionType type) {
    switch (type) {
      case ConnectionType.termux: return TermuxConnectionProvider();
      case ConnectionType.ssh: return SSHConnectionProvider();
      case ConnectionType.local: return LocalConnectionProvider();
    }
  }
}
```

### Registry Pattern
Manages Nexi agents.

```dart
class NexiRegistry {
  void register(NexiAgent agent);
  NexiAgent? get(String id);
  List<NexiAgent> getAll();
}
```

### Provider Pattern (Riverpod)
Dependency injection and state management.

```dart
final connectionProvider = StateNotifierProvider<ConnectionNotifier, ConnectionStatus>((ref) {
  return ConnectionNotifier();
});
```

## Data Flow

### Connection Flow
1. User selects connection mode
2. `ConnectionFactory` creates appropriate provider
3. Provider connects and updates status
4. Status streamed to UI via Riverpod
5. UI updates reactively

### File Operations Flow
1. User interacts with file explorer
2. UI calls use case
3. Use case calls repository
4. Repository delegates to connection provider
5. Result returned through layers
6. UI updates

### AI Chat Flow
1. User sends message
2. Message added to state
3. AI provider called with messages
4. Response streamed back
5. Tool calls parsed and executed
6. Results added to conversation
7. UI updates reactively

## State Management

### Connection State
```dart
final connectionProvider = StateNotifierProvider<ConnectionNotifier, ConnectionStatus>
```
Manages connection lifecycle and status.

### File Explorer State
```dart
final currentPathProvider = StateProvider<String>
final filesProvider = FutureProvider.family<List<FileNode>, String>
```
Manages current directory and file list.

### Editor State
```dart
final tabsProvider = StateNotifierProvider<TabsNotifier, List<EditorTab>>
final activeTabIdProvider = StateProvider<String?>
```
Manages open tabs and active tab.

### Nexi State
```dart
final activeNexiProvider = StateProvider<NexiAgent?>
```
Manages selected AI agent.

## Testing Strategy

### Unit Tests
Test business logic in isolation.
- Use cases
- Entities
- Utilities

### Widget Tests
Test UI components.
- Individual widgets
- Screen layouts
- User interactions

### Integration Tests
Test complete flows.
- Connection flow
- File operations
- AI chat

## Performance Considerations

### Lazy Loading
- File lists loaded on demand
- Large files handled efficiently
- Tabs loaded as needed

### State Optimization
- Riverpod prevents unnecessary rebuilds
- Memoization for expensive computations
- Efficient state updates

### Memory Management
- Dispose controllers properly
- Clear unused data
- Limit cache size

## Security

### API Keys
- Stored in SharedPreferences
- Never committed to version control
- Configurable per user

### SSH Credentials
- Stored securely in Isar
- Encrypted at rest
- Never logged

### File Access
- Respects connection permissions
- Validates paths
- Handles errors gracefully

## Extensibility

### Adding Connection Types
1. Implement `ConnectionProvider`
2. Add to `ConnectionFactory`
3. Create setup screen
4. Register in router

### Adding Tools
1. Register in `ToolRegistry`
2. Implement handler function
3. Add to tool list

### Adding Nexi Agents
1. Create `NexiAgent` instance
2. Register in `NexiRegistry`
3. Agent appears in marketplace

### Adding Features
1. Create feature module in `lib/features/`
2. Follow Clean Architecture layers
3. Use Riverpod for state
4. Add routes as needed

## Best Practices

### Code Organization
- One class per file
- Group related files
- Clear naming conventions
- Consistent structure

### State Management
- Use appropriate provider type
- Keep state minimal
- Dispose resources
- Handle loading/error states

### Error Handling
- Try-catch in async operations
- User-friendly error messages
- Log errors for debugging
- Graceful degradation

### Performance
- Avoid unnecessary rebuilds
- Use const constructors
- Lazy load data
- Profile regularly

## Future Enhancements

### Planned Features
- Context Engine (file indexing)
- Smart Memory (persistent memory)
- File Changes Tracking (diff UI)
- Advanced Editor (minimap, split view)
- Voice Input
- Gesture Controls
- Offline Mode

### Technical Debt
- Add comprehensive tests
- Improve error handling
- Optimize performance
- Add analytics
- Implement crash reporting

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Domain-Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)
