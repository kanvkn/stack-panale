# Creating Custom Nexi Agents

## Overview
The Nexi system is designed to be easily extensible. You can create custom agents by following this guide.

## Agent Structure

```dart
import '../domain/entities/nexi_agent.dart';
import '../infrastructure/nexi_registry.dart';

final myCustomAgent = NexiAgent(
  config: const NexiConfig(
    id: 'my-custom-agent',           // Unique ID
    name: 'My Custom Agent',          // Display name
    description: 'What this agent does', // Short description
    icon: 'icon_name',                // Icon identifier
    color: '#FF5733',                 // Hex color
    gradient: 'from-red-500 to-orange-600', // Gradient (unused in Flutter)
    category: NexiCategory.development, // Category
    version: '1.0.0',                 // Version
    author: 'Your Name',              // Optional author
  ),
  tools: const [
    'read_file',
    'list_files',
    'write_file',
    'execute_command',
  ],
  systemPrompt: '''You are a Custom Nexi agent.

Your role:
- Describe what this agent does
- List key responsibilities
- Explain approach

Be helpful and specific.''',
  welcomeMessage: 'Hey! I\'m **My Custom Agent**. I can help you with...',
  placeholderText: 'Ask me to...',
  capabilities: const [
    'Capability 1',
    'Capability 2',
    'Capability 3',
  ],
);

void registerMyCustomAgent() {
  NexiRegistry().register(myCustomAgent);
}
```

## Available Tools

- `read_file` - Read file content
- `list_files` - List directory contents
- `write_file` - Write to file
- `execute_command` - Run shell commands

## Categories

- `NexiCategory.development` - Development tools
- `NexiCategory.analysis` - Code analysis
- `NexiCategory.testing` - Testing tools
- `NexiCategory.documentation` - Documentation
- `NexiCategory.other` - Other

## Icon Names

- `search_code` - Search icon
- `bug_report` - Bug icon
- `description` - Document icon
- `smart_toy` - Default AI icon

## Registration

1. Create your agent file in `lib/features/nexi/agents/`
2. Import and call registration function in `nexi_marketplace.dart`:

```dart
import '../agents/my_custom_agent.dart';

final nexiRegistryProvider = Provider((ref) {
  final registry = NexiRegistry();
  registerCodeReviewAgent();
  registerDebuggingAgent();
  registerDocumentationAgent();
  registerMyCustomAgent(); // Add your agent
  return registry;
});
```

## Example: Testing Agent

```dart
final testingAgent = NexiAgent(
  config: const NexiConfig(
    id: 'testing',
    name: 'Test Generator',
    description: 'Generates unit tests for your code',
    icon: 'check_circle',
    color: '#10B981',
    gradient: 'from-green-500 to-emerald-600',
    category: NexiCategory.testing,
    version: '1.0.0',
  ),
  tools: const [
    'read_file',
    'write_file',
    'list_files',
  ],
  systemPrompt: '''You are a Testing Nexi, expert at writing tests.

Your role:
- Generate comprehensive unit tests
- Follow testing best practices
- Use appropriate testing frameworks
- Ensure good coverage

Write clear, maintainable tests.''',
  welcomeMessage: 'Hey! I\'m **Test Generator**. Point me to code and I\'ll write tests!',
  placeholderText: 'Ask me to generate tests...',
  capabilities: const [
    'Generate unit tests',
    'Write integration tests',
    'Create test fixtures',
    'Mock dependencies',
  ],
);
```

## Best Practices

1. **Clear System Prompt**: Be specific about the agent's role and approach
2. **Relevant Tools**: Only include tools the agent needs
3. **Good Description**: Help users understand what the agent does
4. **Unique ID**: Use kebab-case, descriptive IDs
5. **Appropriate Category**: Choose the right category for discoverability

## Hot Reload

During development, agents are registered when the app starts. Use hot reload to see changes.

## Testing Your Agent

1. Register the agent
2. Open Nexi Marketplace
3. Select your agent
4. Test in Nexor chat
5. Verify system prompt and tools work correctly

## Advanced: Custom Tools

To add custom tools, register them in the ToolRegistry:

```dart
ToolRegistry.register('my_tool', (params, provider) async {
  // Your tool implementation
  return ToolResult(
    toolCallId: '',
    success: true,
    result: 'Tool output',
  );
});
```

Then include 'my_tool' in your agent's tools list.
